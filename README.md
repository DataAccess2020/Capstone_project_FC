![Logo](fig/dapscologo.jpg)
## Capstone Project
### Francesco Catalfamo

# US Senate: loyalty and relationship through the first session of the 117th Congress
Thanks to its federal composition, the US Senate has always been a central place where the legislation must be done. At the same time, ever thanks to its federal composition, political analyst and commentator said that *the system is broken* because it will be difficult for Democrats to be the majority in the next few years.

Because of these prerequisites, the analysis will be on the US Senate, especially on the relationship between each US Senator and their Party Leader to observe the loyalty of them during each vote that occurred during the first session of the 117th Congress but also to analyze the connection between every member of the US upper chamber while they are making laws. 

#### Research questions
This analysis will be based on two different research question: 

- Analysis of the loyalty of each US Senator using the value in the table below to calculate the loyalty value for each Senator respect to their party leader, in relationship with the year of first election

| Leader | `Mitch McConnell` | GOP vote | value | `Chuck Schumer` | DEM vote | value |
| :--- | :---: |  :---: |  :---: |  :---: |  :---: |  :---: | 
| Yes | `Yes` | Yes | 0.5 | `Yes` | Yes | 1.5 |
| Yes | `Yes` | No | 0 | `Yes` | No | 2 | 
| Yes | `Yes` | Not vote | 0.25 | `Yes` | Not vote | 1.75 | 
| No | `No` | Yes | 1.5 | `No` | Yes | 0.5 |
| No | `No` | No | 0.5 | `No` | No | 1.5 |
| No | `No` | Not vote | 1 | `No` | Not vote | 1 |
| Not vote | `Not vote` | Yes | 1 | `Not vote` | Yes | 1 |
| Not vote | `Not vote` | No |0.25 | `Not vote` | No | 1.75 |
| Not vote | `Not vote` | Not vote | 0.5 | `Not vote` | Not vote | 1.5 |

- Network analysis of the relationship between Senators in the introduced bills, using sponsorship and cosponsorship they had proposed last year

#### Hypothesis and expected results
In the first research question the main hypothesis is that the *Democratic* and *Independent* member (that caucused with them) will have about a similar value, thanks to the fact that they have the majority, while the *Republican* could have a more distributed value, thanks to the fact that Democrats sometimes try to include them to make bipartisan laws or to overpass super-majority if it is required. Thanks to the use of the year of the first election, the main objective is to observe if senior member of the upper chamber of the US Congress use to vote more like the their leader while junior member tend to vote differently.

In the second research question the main objective is to inspect the polarization that occurs in the US by observe if Senator made laws just with their party's member or if they use to do also with the other one. In the graph, it is expected to see that the majority of the member of the two parties made laws just with their same party while there is a few Senator that use to make, or almost try, to pass legislation with bipartisan support. 

#### Dataset and analysis
The used data will be taken from:
- Regard of the first research question, I will  use the API from `ProPublica` from which I will extract the 528 votes held during the first session of the 117th Congress in a `json` list. I will use to vote cast by all the Senator regarding to the vote cast by each Party Leader, and with the obtained value I will construct a graph in which i will observe if the senior Senators were more loyal to the Leader.

- Regard the second research question, I will use `govinfo` to download a zip folder that contains 3687 `xml` with the text of each proposed bill form which I will take the complete list of sponsor and cosponsor of all the laws. From the extracted information, I will build a network analysis codifying and coloring differently who was the sponsor and who is the cosponsor.

#### Directory structure
| Directory | Functionality |
| :---: | :--- | 
| `src` | All the useful scripts |
| `fig` | Graph and figures |
| `old` | Old and useless scripts |
| `doc` | Eventual documentation |
| `output` | The final work |
| `data` | A private directory for dataframe downloaded |

#### References
- Jones. D. R., (2001) Party Polarization and Legislative Gridlock, Political Research Quarterly, University of Utah
- Burden B. C., (2011) Polarization, Obstruction, and Governing in the Senate, The Forum, University of Wisconsin - Madison
- Carson J. L., (2008) Electoral Accountability, Party Loyalty, and Roll-Call Voting in the U.S. Senate, Chicago Scholarship, Oxford University Press
- Treul S. A., (2007) Ambition and Party Loyalty in the US Senate, Midwest Political Science Association, University of Minnesota