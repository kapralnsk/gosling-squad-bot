from telebot import TeleBot
from environs import Env


env = Env()
bot = TeleBot(env('TELEBOT_TOKEN'))
with open('gosling.jpg', 'rb') as gosling:
    bot.send_photo(chat_id=env('CHAT_ID'), photo=gosling)
