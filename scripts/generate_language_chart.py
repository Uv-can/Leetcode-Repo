from __future__ import annotations

import math
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
README_PATH = ROOT / "README.md"
CHART_PATH = ROOT / "assets" / "language-breakdown.svg"

SECTION_HEADING = "## Language Breakdown"

LANGUAGES = {
    "Python": {
        "glob": "*/solution.py",
        "color": "#3572A5",
    },
    "SQL": {
        "glob": "*/solution.sql",
        "color": "#E38C00",
    },
}


def count_problems() -> dict[str, int]:
    return {
        language: sum(1 for path in ROOT.glob(config["glob"]) if path.is_file())
        for language, config in LANGUAGES.items()
    }


def percent(count: int, total: int) -> float:
    if total == 0:
        return 0.0
    return count / total * 100


def polar_to_cartesian(cx: float, cy: float, radius: float, angle: float) -> tuple[float, float]:
    radians = math.radians(angle - 90)
    return cx + radius * math.cos(radians), cy + radius * math.sin(radians)


def pie_slice_path(cx: float, cy: float, radius: float, start_angle: float, end_angle: float) -> str:
    start_x, start_y = polar_to_cartesian(cx, cy, radius, end_angle)
    end_x, end_y = polar_to_cartesian(cx, cy, radius, start_angle)
    large_arc = 1 if end_angle - start_angle > 180 else 0
    return (
        f"M {cx:.2f} {cy:.2f} "
        f"L {start_x:.2f} {start_y:.2f} "
        f"A {radius:.2f} {radius:.2f} 0 {large_arc} 0 {end_x:.2f} {end_y:.2f} Z"
    )


def build_svg(counts: dict[str, int]) -> str:
    total = sum(counts.values())
    width = 680
    height = 360
    cx = 180
    cy = 205
    radius = 110

    if total == 0:
        slices = [
            '<circle cx="180" cy="205" r="110" fill="#D1D5DB" />',
            '<text x="180" y="211" text-anchor="middle" font-size="18" fill="#374151">No submissions yet</text>',
        ]
    else:
        slices = []
        angle = 0.0
        for language, config in LANGUAGES.items():
            share = counts[language] / total
            next_angle = angle + share * 360
            if counts[language] == total:
                slices.append(f'<circle cx="{cx}" cy="{cy}" r="{radius}" fill="{config["color"]}" />')
            elif counts[language] > 0:
                slices.append(
                    f'<path d="{pie_slice_path(cx, cy, radius, angle, next_angle)}" '
                    f'fill="{config["color"]}" />'
                )
            angle = next_angle

    legend_rows = []
    for index, (language, config) in enumerate(LANGUAGES.items()):
        y = 132 + index * 54
        language_percent = percent(counts[language], total)
        legend_rows.append(
            f'<rect x="380" y="{y - 17}" width="18" height="18" rx="3" fill="{config["color"]}" />'
            f'<text x="412" y="{y}" font-size="20" font-weight="600" fill="#111827">{language}</text>'
            f'<text x="412" y="{y + 24}" font-size="16" fill="#4B5563">'
            f'{counts[language]} problems ({language_percent:.1f}%)</text>'
        )

    generated_note = f"{total} total solutions"

    return f"""<svg width="{width}" height="{height}" viewBox="0 0 {width} {height}" xmlns="http://www.w3.org/2000/svg" role="img" aria-labelledby="title desc">
  <title id="title">Python and SQL solution breakdown</title>
  <desc id="desc">Pie chart showing Python and SQL LeetCode problem totals and percentages.</desc>
  <rect width="{width}" height="{height}" rx="16" fill="#F9FAFB" />
  <text x="34" y="44" font-size="24" font-weight="700" fill="#111827">Submission Language Breakdown</text>
  <text x="34" y="72" font-size="15" fill="#4B5563">{generated_note}</text>
  {"".join(slices)}
  <circle cx="{cx}" cy="{cy}" r="72" fill="#F9FAFB" />
  <text x="{cx}" y="{cy - 6}" text-anchor="middle" font-size="32" font-weight="700" fill="#111827">{total}</text>
  <text x="{cx}" y="{cy + 22}" text-anchor="middle" font-size="15" fill="#4B5563">solutions</text>
  {"".join(legend_rows)}
</svg>
"""


def build_readme_section(counts: dict[str, int]) -> str:
    total = sum(counts.values())
    rows = []
    for language in LANGUAGES:
        rows.append(f"| {language} | {counts[language]} | {percent(counts[language], total):.1f}% |")

    return f"""{SECTION_HEADING}

![Python and SQL solution breakdown](assets/language-breakdown.svg)

| Language | Problems | Percentage |
| --- | ---: | ---: |
{chr(10).join(rows)}
| **Total** | **{total}** | **100.0%** |"""


def update_readme(section: str) -> None:
    existing = README_PATH.read_text(encoding="utf-8") if README_PATH.exists() else "# Leetcode-Repo\n"

    if "<!-- LANGUAGE_STATS_START -->" in existing and "<!-- LANGUAGE_STATS_END -->" in existing:
        before = existing.split("<!-- LANGUAGE_STATS_START -->", 1)[0].rstrip()
        after = existing.split("<!-- LANGUAGE_STATS_END -->", 1)[1].lstrip()
        updated = f"{before}\n\n{section}\n"
        if after:
            updated += f"\n{after}"
    elif SECTION_HEADING in existing:
        before, rest = existing.split(SECTION_HEADING, 1)
        next_heading_index = rest.find("\n## ")
        after = rest[next_heading_index + 1 :].lstrip() if next_heading_index != -1 else ""
        updated = f"{before.rstrip()}\n\n{section}\n"
        if after:
            updated += f"\n{after}"
    else:
        updated = f"{existing.rstrip()}\n\n{section}\n"

    README_PATH.write_text(updated, encoding="utf-8")


def main() -> None:
    counts = count_problems()
    CHART_PATH.parent.mkdir(parents=True, exist_ok=True)
    CHART_PATH.write_text(build_svg(counts), encoding="utf-8")
    update_readme(build_readme_section(counts))


if __name__ == "__main__":
    main()
