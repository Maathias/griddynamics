# Create a script that accepts the file name and puts its extension to output.
# If there is no extension - an exception should be raised.
#
# Given a list of integers. Remove duplicates from the list and create a tuple. Find the minimum and maximum number.
#
# Create a script that reads the access log from a file.
# The name of the file is provided as an argument.
# An output of the script should provide the total number of different User Agents and then provide statistics with the number of requests from each of them.
# Here is a link to an example access.log file, https://drive.google.com/file/d/1x6t1gFICCeN2RwTxG1IyDfr1FlgSQNfk/view
#
# Given an input string, count occurrences of all characters within a string
# (e.g. pythonnohtyppy -> p:3, y:3, t:2, h:2, o:2, n:2).
#
# Write a script that gets system information like:
#  distro info, memory(total, used, free),
#  CPU info (model, core numbers, speed),
#  current user,
#  system load average,
#  IP address.
# Use arguments for specifying resources.
# (For example, -d for distro -m for memory, -c for CPU, -u for user info, -l for load average, -i for IP address).
#

# ! This task iss very confusing.
# ! It's not specified if its supposed to be a single script or multiple, so I'm going to make a function for each "subtask"

import re
import subprocess


def get_extension(file_name):
    if "." not in file_name:
        raise ValueError("No extension found")
    return file_name.split(".")[-1]


def remove_duplicates(numbers):
    deduplicated = tuple(set(numbers))
    min = float("inf")
    max = float("-inf")

    for number in deduplicated:
        if number < min:
            min = number
        if number > max:
            max = number

    return (deduplicated, min, max)


def read_access_log(file_name):
    with open(file_name, "r") as file:
        access_log = file.read().split("\n")

    user_agents = {}
    for line in access_log:
        user_agent = re.search(r".*\"(.*)\"", line).group(1)
        if user_agent in user_agents:
            user_agents[user_agent] += 1
        else:
            user_agents[user_agent] = 1


def count_occurrences(string):
    occurrences = {}
    for char in string:
        if char in occurrences:
            occurrences[char] += 1
        else:
            occurrences[char] = 1
    return occurrences


def get_system_info(arg):
    if arg == "-d":
        cmd = ["lsb_release", "-a"]
    if arg == "-m":
        cmd = ["free", "-h"]
    if arg == "-c":
        cmd = ["lscpu"]
    if arg == "-u":
        cmd = ["whoami"]
    if arg == "-l":
        cmd = ["uptime"]
    if arg == "-i":
        cmd = ["hostname", "-I"]

    return subprocess.run(cmd, capture_output=True).stdout.decode("utf-8")
