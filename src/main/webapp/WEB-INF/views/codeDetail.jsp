<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/4/25
  Time: 10:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>CodeDetail</title>
    <link src="/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<xmp style="font-size: 24px;font-family: 'Times New Roman';">
#include<iostream>
#include<cstdio>
#include<cstring>
using namespace std;
int day[102];
int sum[102];
int main()
{
    int n,k,T;
    cin>>T;
    while(T--)
    {
        cin>>n>>k;
        for(int i=1;i<=n;i++)
           cin>>day[i];
         day[0]=0;day[n+1]=100;
        if(k>=n)
          cout<<100<<endl;
        else
        {
            for(int i=0;i<=n;i++)
            sum[i]=day[i+1]-day[i]-1;
            int max=0;
            for(int i=0;i<=n-k;i++)
              {int tp=0;
                  for(int j=0;j<=k;j++)
                     tp+=sum[i+j];
                 if(tp>max)
                     max=tp;
              }
              cout<<max+k<<endl;



        }
    }
return 0;
}
</xmp>
</body>
</html>
