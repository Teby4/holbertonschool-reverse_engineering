#!/usr/bin/env python3

flag = "9E89846A786585866A977D797C8463807C7F6B67848BAB907B698370896B997C797C8D6C6F7E81AE866AB36D7B7F669D7E6A7F96678F9382898263B474"
key = "mysecretkey"

flag = bytes.fromhex(flag)
key = key.encode()

plaintext = bytearray()

for i in range(len(flag)):
    decrypted = (flag[i] - key[(i + 1) % 11]) ^ key[i % 11]
    plaintext.append(decrypted)


print("Decrypted Text:", plaintext.decode(errors='ignore'))
