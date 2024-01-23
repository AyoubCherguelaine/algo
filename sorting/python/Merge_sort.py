def tri_fusion(arr):
    if len(arr) > 1:
        mid1 = len(arr) // 3
        mid2 = 2 * len(arr) // 3

        left = arr[:mid1]
        middle = arr[mid1:mid2]
        right = arr[mid2:]

        tri_fusion(left)
        tri_fusion(middle)
        tri_fusion(right)

        i = j = k = l = 0

        while i < len(left) and j < len(middle) and k < len(right):
            if left[i] < middle[j] and left[i] < right[k]:
                arr[l] = left[i]
                i += 1
            elif middle[j] < right[k]:
                arr[l] = middle[j]
                j += 1
            else:
                arr[l] = right[k]
                k += 1
            l += 1

        while i < len(left):
            arr[l] = left[i]
            i += 1
            l += 1

        while j < len(middle):
            arr[l] = middle[j]
            j += 1
            l += 1

        while k < len(right):
            arr[l] = right[k]
            k += 1
            l += 1


# Example usage:
arr = [38, 27, 43, 3, 9, 82, 10]
tri_fusion(arr)
print("Sorted array:", arr)
