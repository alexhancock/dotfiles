URLSAFE_BASE64_ALPHABET = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_"
URLSAFE_BASE64_ALPHABET_REV = {}
for c, i in URLSAFE_BASE64_ALPHABET
    URLSAFE_BASE64_ALPHABET_REV[c] = i

decodeId =  (s) ->
  if s?.length != 9
    return if /^\d+$/.test(s) then parseInt(s) else undefined

  i = 0
  for c in s
    i = i * 64 + URLSAFE_BASE64_ALPHABET_REV[c]
  i

console.log(decodeId(process.argv[2]))
