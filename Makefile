FILE := abc

$(FILE): xyz
	echo $(FILE) > "something"

xyz:
	echo "xyz" > xyz
