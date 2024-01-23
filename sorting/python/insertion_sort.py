def insertion_sort(arr):
    n = len(arr)

    for i in range(1, n):
        key = arr[i]
        j = i - 1

        # Move elements of arr[0..i-1] that are greater than key to one position ahead of their current position
        while j >= 0 and key < arr[j]:
            arr[j + 1] = arr[j]
            j -= 1

        arr[j + 1] = key

# Example usage:
my_list = [12, 11, 13, 5, 6]
insertion_sort(my_list)
print("Sorted array:", my_list)



# [12, 11, 13, 5, 6]
# [11, 12, 13, 5, 6]
# [11, 12, 13, 5, 6]
# [11, 12, 5, 13, 6]
# [11, 5, 12, 13, 6]
# [5, 11, 12, 13, 6]
# [5, 11, 12, 6, 13]
# [5, 11, 6, 12, 13]
# [5, 6, 11, 12, 13]
# [5, 6, 11, 12, 13]
# 
