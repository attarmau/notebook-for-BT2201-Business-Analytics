df['put ur column name here'].dtype # dtype('float64')
df.info()
df.describe()
df.isnull().sum() # check missing value

# grafical representation of columns having % null values
plt.figure(figsize= (20,4),dpi=300)
NA_col.plot(kind = 'bar')
plt.title (' columns having null values')
plt.ylabel('% null values')
plt.show()
