def selection_sort(array):
    n = len(array)

    for i in range(n):
        min_index = i
        for j in range(i + 1, n):
            if array[j] < array[min_index]:
                min_index = j

        # Swap the found minimum element with the first element
        array[i], array[min_index] = array[min_index], array[i]

    return array


# Example usage:
my_list = [12, 11, 13, 5, 6]
selection_sort(my_list)
print("Sorted array:", my_list)