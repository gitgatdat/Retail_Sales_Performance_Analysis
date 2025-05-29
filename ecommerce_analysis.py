import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

# Load dataset
df = kagglehub.load_dataset(
    KaggleDatasetAdapter.PANDAS,
    "thedevastator/unlock-profits-with-e-commerce-sales-data",
    ""
)

# Clean data
df = df.dropna(subset=['Amount', 'Category'])  # Remove missing values
df['Date'] = pd.to_datetime(df['Date'], errors='coerce')  # Convert Date to datetime

# Group by category for total sales
category_sales = df.groupby('Category')['Amount'].sum().reset_index()

# Plot sales by category
sns.barplot(x='Amount', y='Category', data=category_sales)
plt.title('E-commerce Sales by Product Category')
plt.savefig('category_sales.png')
plt.show()

# Plot monthly sales trends
df['Month'] = df['Date'].dt.to_period('M')
monthly_sales = df.groupby('Month')['Amount'].sum().reset_index()
sns.lineplot(x='Month', y='Amount', data=monthly_sales)
plt.title('Monthly Sales Trends')
plt.xticks(rotation=45)
plt.savefig('monthly_sales.png')
plt.show()

# Plot sales by fulfillment method
fulfilment_sales = df.groupby('Fulfilment')['Amount'].sum().reset_index()
sns.barplot(x='Amount', y='Fulfilment', data=fulfilment_sales)
plt.title('Sales by Fulfillment Method')
plt.savefig('fulfilment_sales.png')
plt.show()
