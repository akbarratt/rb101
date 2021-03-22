flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

# flintstones.delete_if {|k, v| k != "Barney"}
# Missed the part about turning into an array

flintstones.assoc("Barney")