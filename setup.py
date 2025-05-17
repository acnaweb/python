import os
from setuptools import setup, find_packages

def read_requirements(filename):
    """Lê um arquivo de requirements e retorna uma lista de pacotes."""
    with open(filename, encoding="utf-8") as f:
        return [line.strip() for line in f if line.strip() and not line.startswith("#")]


REQUIRED_PACKAGES = read_requirements("requirements.txt")

QUALITY_PACKAGES = []
if os.path.exists("requirements.quality.txt"):
    QUALITY_PACKAGES = read_requirements("requirements.quality.txt")

DEV_PACKAGES = []
if os.path.exists("requirements.dev.txt"):
    DEV_PACKAGES = read_requirements("requirements.dev.txt") + QUALITY_PACKAGES

README = ""
if os.path.exists("README.md"):
    README = open("README.md").read()

setup(
    name="python-pkg",
    version="0.5.0",
    long_description=README,
    long_description_content_type="text/markdown",
    author="acnaweb",
    author_email="ac@marketmining.com.br",
    url="https://github.com/acnaweb/python",
    install_requires=REQUIRED_PACKAGES,
    extras_require={"dev": DEV_PACKAGES, "quality": QUALITY_PACKAGES},
    packages=find_packages(include=["src", "src.*"]),
    platforms="any",
)
