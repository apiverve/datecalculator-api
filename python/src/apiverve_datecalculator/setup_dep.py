from setuptools import setup, find_packages

setup(
    name='apiverve_datecalculator',
    version='1.2.2',
    packages=find_packages(),
    include_package_data=True,
    install_requires=[
        'requests',
        'setuptools'
    ],
    description='Date Calculator computes the difference between two calendar dates in minutes, hours, days, weeks, months, and years. Supply start and end dates in YYYY-MM-DD format to receive exact interval breakdowns.',
    author='APIVerve',
    author_email='hello@apiverve.com',
    url='https://apiverve.com/marketplace/datecalculator?utm_source=pypi&utm_medium=referral&utm_content=homepage',
    classifiers=[
        'Programming Language :: Python :: 3',
        'Operating System :: OS Independent',
    ],
    python_requires='>=3.6',
)
