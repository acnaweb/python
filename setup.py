# https://setuptools.pypa.io/en/latest/userguide/declarative_config.html

from setuptools import setup, find_packages

with open("requirements.txt") as f:
    REQUIRED_PACKAGES = f.read().splitlines()

with open("requirements.dev.txt") as f:
    DEV_PACKAGES = f.read().splitlines()

setup(
    name="python-pkg",
    version="0.0.1",
    author="AcNaWeb",
    author_email="ac@marketmining.com.br",
    url="https://github.com/acnaweb/python",
    install_requires=REQUIRED_PACKAGES,
    extras_require={"dev": DEV_PACKAGES},
    packages=find_packages(include=["src", "src.*"]),
    # entry_points={"console_scripts": ["dhuoflow=src.main:main"]},
)
