import xml.etree.ElementTree as ET

tree = ET.parse('Currencies.xml')
root = tree.getroot()

currency = []
tags = ['symbol', 'country', 'name', 'abbreviation']

for a in root.findall('./currency'):
    money = {}
    for j in range(len(tags)):
        money[tags[j]] = a[j].text

    currency.append(money)
print(currency)