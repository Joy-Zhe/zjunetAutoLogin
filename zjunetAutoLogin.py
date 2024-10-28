from selenium import webdriver
from selenium.webdriver.common.by import By
import time
import os

options = webdriver.ChromeOptions()
options.add_argument("--headless")
options.add_argument("--no-sandbox")
options.add_argument("--disable-dev-shm-usage")

browser = webdriver.Chrome(options=options)

try:
    path = "https://net.zju.edu.cn"
    browser.get(path)
    time.sleep(2)

    stu_id = os.getenv("STUDENT_ID")
    stu_pwd = os.getenv("STUDENT_PWD")

    username_field = browser.find_element(By.ID, 'username')
    password_field = browser.find_element(By.ID, 'password')

    username_field.send_keys(stu_id)
    password_field.send_keys(stu_pwd)

    login_btn = browser.find_element(By.ID, 'login')
    login_btn.click()

finally:
    browser.quit()
