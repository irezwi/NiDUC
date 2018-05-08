m = 6; % ustawiamy parametr m zgodnie z tabel¹ kodów BCH
n = 2^m - 1; % d³ugoœæ s³owa koduj¹cego
k = 57; % d³ugoœæ s³owa, które kodujemy

msg = gf(GEN(k)); % wygenerowanie wiadomoœci
% [genpoly, t] = bchgenpoly(n, k);
% t = 15; 

% zakodowanie BCH
code = bchenc(msg, n, k);

% przepuszczenie przez kana³
noisy_code = KANALPP(code.x, 0.1);

% zdekodowanie
[decoded_message, err, ccode] = bchdec(gf(noisy_code), n, k);

disp(msg.x);
disp(decoded_message.x);

wrong_bits = numel(find(msg.x ~= decoded_message.x)); % liczba bitów danych odebranych b³êdnie
correct_bits = numel(find(msg.x == decoded_message.x)); % liczba bitów danych odebranych prawid³owo
received_bits = length(decoded_message.x); % liczba odebranych bitów danych
BER = wrong_bits / received_bits; % wyliczenie BER: (liczba bitów danych odebranych b³êdnie) / (liczba odebranych bitów danych)
E = correct_bits / length(ccode); % wyliczenie E: (liczba prawid³owo odebranych bitów danych) / (liczba przes³anych bitów)
disp(BER);
disp(E);
