#!/bin/bash


zainstaluj_wymagania()
{
	sudo apt-get update && sudo apt-get upgrade -y
	git clone https://github.com/hamedA2/Zydra.git
	cd Zydra && sudo chmod 777 *
	sudo bash script.sh
	cd ..
	sudo apt-get install fcrackzip -y zip -y unzip -y
	clear && sudo bash zipcracker.sh
}

Pobierz_slownik()
{
	sudo rm top_polskie_hasla.txt
	sudo wget https://raw.githubusercontent.com/PSZMAJ/WORDLISTS/main/top_polskie_hasla.txt
	sudo chmod 777 top_polskie_hasla.txt
	cd Zydra && rm top_polskie_hasla.txt
	sudo wget https://raw.githubusercontent.com/PSZMAJ/WORDLISTS/main/top_polskie_hasla.txt
	sudo chmod 777 top_polskie_hasla.txt
	cd ..
	clear && sudo bash zipcracker.sh
}

fcrackzip_wordlist_moj()
{
	echo "Podaj sciezke do pliku np. /home/kali/Desktop/plik.zip";
	read sciezka
	echo "Podaj sciezke do slownika np. /usr/share/wordlist/rockyou.txt"
	read slownik
	sudo fcrackzip -u -D -p $slownik $sciezka
		
}

fcrackzip_wordlist_wbudowany()
{
	echo "Podaj sciezke do pliku np. /home/kali/Desktop/plik.zip";
	read sciezka
	sudo fcrackzip -u -D -p top_polskie_hasla.txt $sciezka	
}

zip2john_brute()
{
	echo "Podaj sciezke do pliku np. /home/kali/Desktop/plik.zip";
	read sciezka
	sudo zip2john $sciezka > hash.txt
	sudo chmod 777 hash.txt
	john --wordlist=top_polskie_hasla.txt hash.txt
	sleep 5
	sudo rm hash.txt
}

zydra_wordlists()
{
	echo "Podaj sciezke do pliku np. /home/kali/Desktop/plik.zip";
	read sciezka
	cd Zydra
	python3 Zydra.py -f $sciezka -d top_polskie_hasla.txt
	cd .. && bash zipcracker.sh

}

own_zip_protect()
{
	echo "Podaj nazwe paczki np. zabezpieczone.zip";
	read paczka
	echo "podaj sciezke do zabezpieczenia pliku ";
	read sciezka
	sudo zip -p $paczka $sciezka && sudo zip -e $paczka $sciezka
	sudo bash zipcracker.sh
}

exit_work()
{
	exit
}


figlet zipcracker 1.1
echo " ------------------------------------------------------------------------------ "
echo "   Narzędzie powstało tylko do celów edukacyjnych! --> zipcracker Version 1.1"
echo " ------------------------------------------------------------------------------ "
echo -e "\e[5m  KUP KURS NA WWW.EHAKER.PL \e[0m"
echo -e "\e[5m  KUP KURS NA WWW.EHACKING.PL \e[0m"
echo "Wybierz opcje"
echo "================="
echo -e "\e[31m  [0] ZAINSTALUJ WYMAGANIA \e[0m"
echo -e "\e[31m  [1] (fcrackzip) SZYBKIE LAMANIE HASLA - SLOWNIK UZYTKOWNIKA\e[0m"
echo -e "\e[31m  [2] (fcrackzip) SZYBKIE LAMANIE HASLA - SLOWNIK WBUDOWANY\e[0m"
echo -e "\e[31m  [3] (john2zip) SZYBKIE LAMANIE HASLA - SLOWNIK WBUDOWANY\e[0m - NIEAKTYWNY, oczekuj aktualizacji!"
echo -e "\e[31m  [4] (zydra) SZYBKIE LAMANIE HASLA - SLOWNIK WBUDOWANY\e[0m - NOWOSC" 

echo -e "\e[31m  [99] Zabezpiecz pliki - Generowanie zipa z haslem\e[0m"
echo -e "\e[31m  [100] Pobierz najnowszy slownik hasel \e[0m"
echo -e "\e[31m  [101] WYJSCIE \e[0m"


read opcja
 

case "$opcja" in

  "0") zainstaluj_wymagania ;;
  "1") fcrackzip_wordlist_moj ;;
  "2") fcrackzip_wordlist_wbudowany ;;
  "3") zip2john_brute ;;
  "4") zydra_wordlists ;;
  "99") own_zip_protect ;;
  "100") Pobierz_slownik ;;
  
  "101") exit_work ;;
  *)  clear && ./zipcracker.sh
  
esac



exit
