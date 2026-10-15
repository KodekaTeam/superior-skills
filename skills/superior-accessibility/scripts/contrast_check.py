#!/usr/bin/env python3
"""Report WCAG 2.x contrast for two opaque six-digit sRGB colors."""

from __future__ import annotations

import argparse
import re


HEX = re.compile(r"^#?([0-9a-fA-F]{6})$")


def color(value: str) -> tuple[int, int, int]:
    match = HEX.fullmatch(value.strip())
    if not match:
        raise argparse.ArgumentTypeError("expected a six-digit hex color such as #1A2B3C")
    raw = match.group(1)
    return tuple(int(raw[offset : offset + 2], 16) for offset in (0, 2, 4))


def linearize(channel: int) -> float:
    component = channel / 255
    if component <= 0.04045:
        return component / 12.92
    return ((component + 0.055) / 1.055) ** 2.4


def luminance(rgb: tuple[int, int, int]) -> float:
    red, green, blue = map(linearize, rgb)
    return 0.2126 * red + 0.7152 * green + 0.0722 * blue


def ratio(first: tuple[int, int, int], second: tuple[int, int, int]) -> float:
    high, low = sorted((luminance(first), luminance(second)), reverse=True)
    return (high + 0.05) / (low + 0.05)


def pass_fail(value: float, threshold: float) -> str:
    return "PASS" if value >= threshold else "FAIL"


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("foreground", type=color)
    parser.add_argument("background", type=color)
    args = parser.parse_args()

    result = ratio(args.foreground, args.background)
    print(f"ratio: {result:.2f}:1")
    print(f"normal text 4.5:1: {pass_fail(result, 4.5)}")
    print(f"large text 3.0:1: {pass_fail(result, 3.0)}")
    print(f"non-text 3.0:1: {pass_fail(result, 3.0)}")


if __name__ == "__main__":
    main()
