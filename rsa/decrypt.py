def decrypt(pk, ciphertext):
    # Unpack the key into its components
    key, n = pk
    # Generate the plaintext based on the ciphertext and key using a^b mod m
    plain = [chr((int(char) ** key) % n) for char in ciphertext]
    # Return the array of bytes as a string
    return ''.join(plain)

if __name__ == '__main__':
    f=open("frame.txt","r")
    flag=f.readline()
    f.close()
    while 1:
        if flag == "1\n":
            f = open("frame.txt", "r")
            flag = f.readline()
            encrypted_msg = list(f.readline().split('-'))
            key_pair = (input("Enter a public key and n: ").split())
            keys = list(map(int, key_pair))
            print("Decrypting message with public key ", keys, " . . .")
            print("Your message is:")
            print(decrypt(keys, encrypted_msg))
            f.close()
            f = open("frame.txt", "w")
            f.write("0")
            f.close()
        f = open("frame.txt", "r")
        flag = f.readline()