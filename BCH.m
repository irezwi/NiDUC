m = 6; % ustawiamy parametr m zgodnie z tabel¹ kodów BCH
n = 2^m - 1; % d³ugoœæ s³owa koduj¹cego
k = 7; % d³ugoœæ s³owa, które kodujemy

msg = gf(GEN(k)); % wygenerowanie wiadomoœci
% [genpoly, t] = bchgenpoly(n, k);
t = 15; 

% zakodowanie BCH
code = bchenc(msg, n, k);

% przepuszczenie przez kana³
noisy_code = KANALPP(code.x, 0.1);

% zdekodowanie 
[decoded_message, err, ccode] = bchdec(gf(noisy_code), n, k);

wrong_bits = 0;
for i = 1 : length(msg.x)
    if decoded_message.x(i) ~= msg.x(i)
        wrong_bits = wrong_bits + 1;
    end
end