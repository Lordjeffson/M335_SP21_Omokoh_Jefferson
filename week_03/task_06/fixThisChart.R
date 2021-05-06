library(readr)
library(ggplot2)

rcw <- read_csv("https://byuistats.github.io/M335/data/rcw.csv", 
                col_types = cols(Semester_Date = col_date(format = "%m/%d/%y"), 
                                 Semester = col_factor(levels = c("Winter", "Spring", "Fall"))))
head(rcw)

ggplot(data = rcw, 
       mapping = aes(x = Semester_Date, 
                     y = Count, 
                     color = Department)) +
  geom_line() +
  geom_point()



## a detailed plot showing rcw attendance for each Department over time
ggplot(rcw, aes(x = Semester_Date, y = Count)) + # This line of code assigns the dataset, and sets the values for
  # the x and y axis as global aesthetics.
  geom_smooth(aes(color = Department)) + # This line of code sets the smooth line, and assigns the aesthetics of 
  # department as its color, causing ggplot to assign different colors to each department.
  labs(title = 'Research & Creative Works Conference Attendance', # This line of code assigns labels to the title # and the x and y axis
       x = 'Semester Date', y = 'Number of Students') +
  geom_point() +
  theme_bw()


# Trends Description
# Firstly, we see that the department with the overall highest amount of students participating
# in the research and creative works fair is the ME department, and the overall lowest is the 
# DCM department. The participation rate has varied over time, there was an higher participation from most
# departments in the 2017 session. We saw an overall drop after that, and it has been on a steady climax after that.

