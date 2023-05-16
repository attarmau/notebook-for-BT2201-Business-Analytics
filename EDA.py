df['put ur column name here'].dtype # dtype('float64')
df.info()
df_app.shape # (row number, column number) 
df.describe()
df.isnull().sum() # check missing value
pd.DataFrame(df)

# grafical representation of columns having % null values
plt.figure(figsize= (20,4),dpi=300)
NA_col.plot(kind = 'bar')
plt.title (' columns having null values')
plt.ylabel('% null values')
plt.show()

# Top 10 correlated variables
df.drop(columns=['put your column name that you want to drop here'], inplace=True)
corr = df[df['name of target column'] == 1].corr()
corrdf = corr.where(np.triu(np.ones(corr.shape), k=1).astype(np.bool))
corrdf = corrdf.unstack().reset_index()
corrdf.columns = ['Var1', 'Var2', 'Correlation']
corrdf.dropna(subset = ['Correlation'], inplace = True)
corrdf['Correlation'] = round(corrdf['Correlation'], 2)
corrdf['Correlation'] = abs(corrdf['Correlation'])
corrdf.sort_values(by = 'Correlation', ascending = False).head(10)

my_report = sv.analyze(df)
my_report.show_notebook()
