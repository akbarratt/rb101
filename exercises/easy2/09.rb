name = 'Bob'
save_name = name
name.upcase!
puts name, save_name

# BOB
# BOB

# In the previous example on this exercise, reassignment was used. Because in this example, name and save_name point to the same object (literally the same space in memory), any mutating methods performed on name will be reflected in save_name.