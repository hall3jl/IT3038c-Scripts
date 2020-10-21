from bs4 import BeautifulSoup
import requests, re

headers = {
        'user-agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36',
        'referrer': 'https://google.com',
        'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8',
        'Accept-Encoding': 'gzip, deflate, br',
        'Accept-Language': 'en-US,en;q=0.9',
        'Pragma': 'no-cache',
    }

r  = requests.get("https://www.microcenter.com/search/search_results.aspx?N=4294966937+4294822431&sortby=match&rpp=96", timeout=5, headers=headers).content 
soup = BeautifulSoup(r, 'lxml') 
data = soup.findAll("li", {"class":"product_wrapper"})

print ('Microcenter GPU Prices:')

for products in data:
    product_name = products.findAll("a",{"class":re.compile('(ProductLink)')})
    product_price = products.findAll("span",{"itemprop":"price"})
    print(product_name[0].string + ' = ' + product_price[0].get_text())