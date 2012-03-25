Feature: display list of movies filtered by MPAA rating
 
  As a concerned parent
  So that I can quickly browse movies appropriate for my family
  I want to see movies matching only certain MPAA ratings

Background: movies have been added to database

  Given the following movies exist:
  | title                   | rating | release_date |
  | The Terminator          | R      | 26-Oct-1984  |
  | When Harry Met Sally    | R      | 21-Jul-1989  |
  | Amelie                  | R      | 25-Apr-2001  |
  | The Incredibles         | PG     | 5-Nov-2004   |
  | Raiders of the Lost Ark | PG     | 12-Jun-1981  |
  | The Help                | PG-13  | 10-Aug-2011  |
  | Chocolat                | PG-13  | 5-Jan-2001   |
  | Aladdin                 | G      | 25-Nov-1992  |
  | 2001: A Space Odyssey   | G      | 6-Apr-1968   |
  | Chicken Run             | G      | 21-Jun-2000  |

  And  I am on the RottenPotatoes home page
  
Scenario: restrict to movies with 'PG' or 'R' ratings
	When I check "ratings_PG"
	And I check "ratings_R"  
  	And I uncheck "ratings_PG-13"
  	And I uncheck "ratings_G" 
  	And I press "ratings_submit" 
  	Then I should see   
  | title                   |
  | The Terminator          |
  | When Harry Met Sally    |
  | Amelie                  |
  | The Incredibles         |
  | Raiders of the Lost Ark |
    Then I should not see 
  | title                 |       |             |
  | The Help              | PG-13 | 10-Aug-2011 |
  | Chocolat              | PG-13 | 5-Jan-2001  |
  | 2001: A Space Odyssey | G     | 6-Apr-1968  |
  | Chicken Run           | G     | 21-Jun-2000 |
  | Aladdin               | G     | 25-Nov-1992 |

  
Scenario: restrict to movies with 'PG' or 'R' ratings (general)
	Given I check the following ratings: PG, R
	And I press "ratings_submit" 
  	Then I should see   
  | title                   |
  | The Terminator          |
  | When Harry Met Sally    |
  | Amelie                  |
  | The Incredibles         |
  | Raiders of the Lost Ark |
    Then I should not see 
  | title                 |       |             |
  | The Help              | PG-13 | 10-Aug-2011 |
  | Chocolat              | PG-13 | 5-Jan-2001  |
  | 2001: A Space Odyssey | G     | 6-Apr-1968  |
  | Chicken Run           | G     | 21-Jun-2000 |
  | Aladdin               | G     | 25-Nov-1992 |

Scenario: no ratings selected
  # see assignment

Scenario: all ratings selected
  # see assignment
