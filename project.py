import pandas as pd 

df = pd.read_csv("C:\\E-Commerce Sales Intelligence Dashboard\\superstore cleaned.csv")

#print(df.head())

#print(df.info())

#print (df.shape)

#print(df.isnull().sum())

#print (df.columns)

C = df['order date']=pd.to_datetime(df['order date'])

D = df['ship date'] = pd.to_datetime(df['ship date'])

#print(D)

E = df['order month'] = df['order date'].dt.month_name()

#print(E)

F = df['order year'] = df['order date'].dt.year

#print (F)

G = df['profit_margin'] = (df['profit'] / df['sales']) * 100

#print (G)

H = df['shipping days'] = (
    df['ship date'] - df['order date']
).dt.days

#print(H)

#print(df.groupby('category')['profit'].sum())

#print(df.groupby('category')['sales'].sum())

#print (df.groupby('order month')['sales'].sum())

#print(df[df['profit'] < 0])

#print(df.groupby('discount')[['sales','profit']].mean())

customer_orders = df.groupby('customer id')['order id'].nunique()

one_time_customers = customer_orders[customer_orders == 1]

#print (customer_orders,one_time_customers)

from sqlalchemy import create_engine
import numpy as np

df.to_csv("superstore final.csv", index=False)

df.columns = df.columns.str.strip().str.lower().str.replace(' ', '_')

df.replace([np.inf, -np.inf], np.nan, inplace=True)

engine = create_engine("mysql+mysqlconnector://root:liveptrak@127.0.0.1:3306/E_Commerce")

df.to_sql(
    name="sales",
    con=engine,
    if_exists="replace",
    index=False
)

print("Data successfully loaded into MySQL!")