from setuptools import setup, find_packages

setup(
    name='FlakeyLib',
    packages=find_packages(),
    install_requires=[],
    #setup_requires=['pytest-runner'],
    tests_require=['pytest', 'pytest-pylint', 'pylint'],
)
