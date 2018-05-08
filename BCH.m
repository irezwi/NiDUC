m = 6; % ustawiamy parametr m zgodnie z tabel� kod�w BCH
n = 2^m - 1; % d�ugo�� s�owa koduj�cego
k = 57; % d�ugo�� s�owa, kt�re kodujemy

msg = gf(GEN(k)); % wygenerowanie wiadomo�ci
% [genpoly, t] = bchgenpoly(n, k);
t = 15; 

% zakodowanie BCH
code = bchenc(msg, n, k);

% przepuszczenie przez kana�
noisy_code = KANALPP(code.x, 0.1);

% zdekodowanie
[decoded_message, err, ccode] = bchdec(gf(noisy_code), n, k);

disp(msg.x);
disp(decoded_message.x);

wrong_bits = numel(find(msg.x ~= decoded_message.x)); % liczba bit�w danych odebranych b��dnie
received_bits = length(decoded_message.x); % liczba odebranych bit�w danych
BER = wrong_bits / received_bits; % wyliczenie BER

