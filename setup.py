from pathlib import Path

from setuptools import setup

this_directory = Path(__file__).parent
VERSION = "0.0.3"

setup(
    name="panther_community_detections",
    version=VERSION,
    packages=["panther_community_detections"],
    package_data={"panther_community_detections": ["py.typed"]},
    license="AGPL-3.0",
    description="",
    author="Panther Labs Inc",
    author_email="pypi@runpanther.io",
    url="https://github.com/panther-labs/panther-community-detections",
    download_url=f"https://github.com/panther-labs/panther-community-detections/archive/v{VERSION}.tar.gz",
    keywords=["Security", "Python"],
    classifiers=[
        "Development Status :: 4 - Beta",
        "Intended Audience :: Developers",
        "Topic :: Security",
        "License :: OSI Approved :: GNU Affero General Public License v3",
        "Programming Language :: Python :: 3.9",
    ],
    include_package_data=True,
)
