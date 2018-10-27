// Friday the 13th
// #ID = 1474
// md5: ea5a35a248f68cab692f6739303bafdd

timeofday = {
    0: "Day",
    1: "Evening",
    2: "Night",
}

councilors = {
    0: "George",
    1: "Mark",  
    2: "Paul",
    3: "Laura",
    4: "Debbie",
    5: "Crissy"
}

rich_presence_conditional_display(byte(0x050B) == 0, "Titles")

rich_presence_display("{0} {1}, {2}: {3}/6 councilors, {4}/15 children",
    rich_presence_lookup("TimeOfDay", byte(0x0508), timeofday),
    rich_presence_value("Day", byte(0x0522) + 1),
    rich_presence_lookup("Councilor", byte(0x0507), councilors),
    rich_presence_value("Councilors", byte(0x0504) + 1),
    rich_presence_value("Children", byte(0x0503))
)
