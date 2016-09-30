# Geckoboard tech test

[Link to dashboard](https://zakrichardsonme.geckoboard.com/dashboards/BF73D044F6CCBDC2)

## My approach

I have created a Ruby program that pulls data from blockchain.info/ticker, formats the data needed and pushes it to a Geckoboard Dataset.

Whilst the program(lib/app.rb) is running, it will pull data from the ticker, format it and push it every 5 minutes for each currency entered in the currencies array.

The program dynamically creates/finds datasets and dynamically creates objects with arrays where the data entries are held based on the currencies entered.

This allows for simple additions of other currencies to the dashboard.

The Datasets API types I used were 'money' and 'datetime' to represent the price of a Bitcoin and the time of that exchange rate respectively.

I chose Ruby to do this project as the documentation on the Geckoboard site for  'getting started' focused on JavaScript so I wanted to use Ruby as a challenge.

In order to make the program run repeatedly after set intervals I used a gem called rufus-scheduler. Given more time I would have looked further into Cron jobs and/or other possible solutions to make the program run at certain intervals and decided on which would fit best.

In terms of the dashboard I implemented two line graphs displaying 'BTC to USD' and 'BTC to GBP' over time.

## Next Step

Currently, the program can be run and will push data to the Geckoboard Datasets API however it has no persistent storage within my program, meaning when the program is stopped the data is lost and as Geckoboard Datasets also have no persistent storage, as each 'puts' replaces the current contents, the previous data is lost.

Storing my data in a database instead of the current datastore array would mean the data would persist if the application were to be restarted.

I would also perform more refactoring, one such example being moving the datastore from the Formatter class.
