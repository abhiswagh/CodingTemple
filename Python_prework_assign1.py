#Abhi Wagh

#Question 1
#Write a function to print "hello_USERNAME!" USERNAME is the input of the function. The first line of the code has been defined as below.

def hello_name(user_name):
    print("What is your username?")
    user_name=input()
    print("hello_" + user_name +"!") 

hello_name("user_name")
               
# # Question 2
# # Write a python function, first_odds that prints the odd numbers from 1-100 and returns nothing

def first_odds():
    for x in range(1,101,2):
        print(x)
    return()

first_odds()

               
# # Question 3
# # Please write a Python function, max_num_in_list to return the max number of a given list. The first line of the code has been defined as below.

# list= [22,46,78,92,3,19,38,99,59,38,49,22,1,4,999,234,299999,592]

def max_num_in_list(a_list):
    max= 0
    for i in a_list:
        if i > max:
            max=i
    print(max)

max_num_in_list(list)
               
# # Question 4
# # Write a function to return if the given year is a leap year. A leap year is divisible by 4, but not divisible by 100, unless it is also divisible by 400. The return should be boolean Type (true/false).

def is_leap_year(a_year):
    if a_year%4==0:
        print("True")
        return True
    elif a_year%100!=0 and a_year%400==0:
        print("True")
        return True
    else:
        print("False")
        return False

is_leap_year(2007)


# # Question 5
# # Write a function to check to see if all numbers in list are consecutive numbers. For example, [2,3,4,5,6,7] are consecutive numbers, but [1,2,4,5] are not consecutive numbers. The return should be boolean Type.
list2=[1,2,3,4,5,6,7,8]
list3=[4,5,7,8,6,9,15,19]
list4=[5,6,7,8,9,10]
list5=[1,2,3,7,6,5,4]

def is_consecutive(list_1):
    print (list(range(min(list_1), max(list_1)+1)) == list_1)

print(is_consecutive(list4))


# def is_consecutive(a_list):
#     a_list.sort()
#     counter=a_list[0]
#     for i in range(len(a_list)):
#         i=a_list[i]
#         if i>=counter:
#             counter+=1
#         if i+1==counter:
#             continue
#         else:
#             print("False")
#             return False

# def is_consecutive(a_list):
#     counter=a_list[0]
#     while i >= counter:
#         counter+=1



# /5