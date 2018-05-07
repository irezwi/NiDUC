m = 6; % ustawiamy parametr m zgodnie z tabel� kod�w BCH
n = 2^m - 1; % d�ugo�� s�owa koduj�cego
k = 7; % d�ugo�� s�owa, kt�re kodujemy

msg = gf(GEN(k)); % wygenerowanie wiadomo�ci
% [genpoly, t] = bchgenpoly(n, k);
t = 15; 

% zakodowanie BCH
code = bchenc(msg, n, k);

% przepuszczenie przez kana�
noisy_code = KANALPP(code.x, 0.1);

% zdekodowanie 
[decoded_message, err, ccode] = bchdec(gf(noisy_code), n, k);

wrong_bits = 0;
for i = 1 : length(msg.x)
    if decoded_message.x(i) ~= msg.x(i)
        wrong_bits = wrong_bits + 1;
    end
end