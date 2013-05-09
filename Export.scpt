FasdUAS 1.101.10   ��   ��    k             l      ��  ��   
This script makes some assumptions about the structure of the aperture Library
1) projects are contained within a month folder
2) month folders are contained within a year folder
3) All masters are referenced
4) masters are stored in a similar structure but the month directory is a 2 digit integer not a word
Behaviour could get a bit weird if this is not the case

Masters can be rsynced to the remote server using rsync -L
so that a real copy is made on the remote server but localy in the Published folder it is only a link
     � 	 	" 
 T h i s   s c r i p t   m a k e s   s o m e   a s s u m p t i o n s   a b o u t   t h e   s t r u c t u r e   o f   t h e   a p e r t u r e   L i b r a r y 
 1 )   p r o j e c t s   a r e   c o n t a i n e d   w i t h i n   a   m o n t h   f o l d e r 
 2 )   m o n t h   f o l d e r s   a r e   c o n t a i n e d   w i t h i n   a   y e a r   f o l d e r 
 3 )   A l l   m a s t e r s   a r e   r e f e r e n c e d 
 4 )   m a s t e r s   a r e   s t o r e d   i n   a   s i m i l a r   s t r u c t u r e   b u t   t h e   m o n t h   d i r e c t o r y   i s   a   2   d i g i t   i n t e g e r   n o t   a   w o r d 
 B e h a v i o u r   c o u l d   g e t   a   b i t   w e i r d   i f   t h i s   i s   n o t   t h e   c a s e 
 
 M a s t e r s   c a n   b e   r s y n c e d   t o   t h e   r e m o t e   s e r v e r   u s i n g   r s y n c   - L 
 s o   t h a t   a   r e a l   c o p y   i s   m a d e   o n   t h e   r e m o t e   s e r v e r   b u t   l o c a l y   i n   t h e   P u b l i s h e d   f o l d e r   i t   i s   o n l y   a   l i n k 
   
  
 l     ����  r         4     �� 
�� 
alis  l    ����  b        l   	 ����  I   	��  
�� .earsffdralis        afdr  m    ��
�� afdrscr�  �� ��
�� 
rtyp  m    ��
�� 
TEXT��  ��  ��    m   	 
   �   6 A p e r t u r e : E x p o r t L i b r a r y . s c p t��  ��    o      ���� 0 librarypath libraryPath��  ��        l    ����  r        I   �� ��
�� .sysoloadscpt        file  o    ���� 0 librarypath libraryPath��    o      ���� *0 loadedexportlibrary loadedExportLibrary��  ��         j     �� !�� 	0 p_sql   ! m      " " � # # " / u s r / b i n / s q l i t e 3      $ % $ p     & & ������ 0 dbpath DBPath��   %  ' ( ' p     ) ) ������ 0 	g_libpath 	g_libPath��   (  * + * l     ��������  ��  ��   +  , - , l    .���� . r     / 0 / n     1 2 1 I    �������� 0 
getlibpath 
getLibPath��  ��   2 o    ���� *0 loadedexportlibrary loadedExportLibrary 0 o      ���� 0 	g_libpath 	g_libPath��  ��   -  3 4 3 l   " 5���� 5 r    " 6 7 6 o     ��
�� 
ret  7 o      ���� 0 theout theOut��  ��   4  8 9 8 l     ��������  ��  ��   9  : ; : l  # & <���� < r   # & = > = m   # $��
�� boovfals > o      ���� 0 	libcopied 	libCopied��  ��   ;  ? @ ? l  ' , A���� A r   ' , B C B n   ' * D E D 1   ( *��
�� 
psxp E o   ' (���� 0 	g_libpath 	g_libPath C o      ���� 0 libposix libPOSIX��  ��   @  F G F l  - 8 H���� H r   - 8 I J I c   - 4 K L K l  - 2 M���� M b   - 2 N O N o   - .���� 0 libposix libPOSIX O m   . 1 P P � Q Q , / D a t a b a s e / L i b r a r y . a p d b��  ��   L m   2 3��
�� 
TEXT J o      ���� 0 
libdbposix 
libDBPOSIX��  ��   G  R S R l     ��������  ��  ��   S  T U T l     ��������  ��  ��   U  V W V l  9 @ X���� X r   9 @ Y Z Y m   9 < [ [ � \ \ < / U s e r s / i a i n / P i c t u r e s / P u b l i s h e d Z o      ���� 0 publishedpath PublishedPath��  ��   W  ] ^ ] l  A H _���� _ r   A H ` a ` m   A D b b � c c  / t m p / P u b l i s h e d a o      ���� 0 	backupdir 	BackupDir��  ��   ^  d e d l     ��������  ��  ��   e  f g f l  I X h���� h r   I X i j i c   I T k l k n   I R m n m 1   N R��
�� 
year n l  I N o���� o I  I N������
�� .misccurdldt    ��� null��  ��  ��  ��   l m   R S��
�� 
TEXT j o      ���� 0 curyear  ��  ��   g  p q p l  Y h r���� r r   Y h s t s c   Y d u v u n   Y b w x w m   ^ b��
�� 
mnth x l  Y ^ y���� y I  Y ^������
�� .misccurdldt    ��� null��  ��  ��  ��   v m   b c��
�� 
TEXT t o      ���� 0 curmonth  ��  ��   q  z { z l  i x |���� | r   i x } ~ } c   i t  �  n   i r � � � 1   n r��
�� 
day  � l  i n ����� � I  i n������
�� .misccurdldt    ��� null��  ��  ��  ��   � m   r s��
�� 
TEXT ~ o      ���� 
0 curday  ��  ��   {  � � � l  y � ����� � r   y � � � � c   y � � � � n   y � � � � 1   ~ ���
�� 
time � l  y ~ ����� � I  y ~������
�� .misccurdldt    ��� null��  ��  ��  ��   � m   � ���
�� 
TEXT � o      ���� 0 curtime  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l  � � ����� � r   � � � � � c   � � � � � n   � � � � � I   � ��� ����� 0 monthtointeger   �  ��� � o   � ����� 0 curmonth  ��  ��   � o   � ����� *0 loadedexportlibrary loadedExportLibrary � m   � ���
�� 
TEXT � o      ���� 0 monthint  ��  ��   �  � � � l  � � ����� � Z   � � � ���~ � =  � � � � � n   � � � � � 1   � ��}
�} 
leng � o   � ��|�| 0 monthint   � m   � ��{�{  � r   � � � � � b   � � � � � m   � � � � � � �  0 � o   � ��z�z 0 monthint   � o      �y�y 0 monthint  �  �~  ��  ��   �  � � � l     �x�w�v�x  �w  �v   �  � � � l     �u � ��u   �  ** Choose a project **    � � � � , * *   C h o o s e   a   p r o j e c t   * * �  � � � l  � � ��t�s � r   � � � � � n   � � � � � I   � ��r ��q�r 0 chooseproject chooseProject �  ��p � I  � ��o�n�m
�o .misccurdldt    ��� null�n  �m  �p  �q   � o   � ��l�l *0 loadedexportlibrary loadedExportLibrary � o      �k�k 0 pr  �t  �s   �  � � � l     �j�i�h�j  �i  �h   �  � � � l     �g�f�e�g  �f  �e   �  � � � l  � � ��d�c � r   � � � � � b   � � � � � b   � � � � � b   � � � � � b   � � � � � b   � � � � � b   � � � � � o   � ��b�b 0 publishedpath PublishedPath � m   � � � � � � �  / � o   � ��a�a 0 curyear   � m   � � � � � � �  / � o   � ��`�` 0 monthint   � m   � � � � � � �  / � o   � ��_�_ 0 pr   � o      �^�^ 0 directorypath  �d  �c   �  � � � l  � � ��]�\ � r   � � � � � b   � � � � � b   � � � � � b   � � � � � b   � � � � � b   � � � � � o   � ��[�[ 0 	backupdir 	BackupDir � m   � � � � � � �  / � o   � ��Z�Z 0 curyear   � o   � ��Y�Y 0 curmonth   � o   � ��X�X 
0 curday   � o   � ��W�W 0 curtime   � o      �V�V 0 prbackupdir PrBackupDir�]  �\   �  � � � l  �
 ��U�T � r   �
 � � � b   � � � � o   ��S�S 0 directorypath   � m   � � � � �  / m a s t e r s � o      �R�R 0 masterspath mastersPath�U  �T   �  � � � l  ��Q�P � r   � � � b   � � � o  �O�O 0 directorypath   � m   � � � � �  / t h u m b s � o      �N�N 0 
thumbspath  �Q  �P   �  � � � l " ��M�L � r  " � � � b   � � � o  �K�K 0 directorypath   � m   � � �    / w a t e r m a r k e d � o      �J�J 0 watermarkedpath  �M  �L   �  l     �I�H�G�I  �H  �G    l #��F�E O  #� O  )�	 k  4�

  l 44�D�D     get the project notes    � ,   g e t   t h e   p r o j e c t   n o t e s  r  4S b  4O b  4K b  4E b  4A o  49�C�C 	0 p_sql   l 9@�B�A n  9@ 1  <@�@
�@ 
strq o  9<�?�? 0 
libdbposix 
libDBPOSIX�B  �A   m  AD �   `   " s e l e c t   n o t e   f r o m   R K N O T E   w h e r e   A T T A C H E D T O U U I D = ' 1  EJ�>
�> 
ID   m  KN!! �""  ' " o      �=�= 0 	thescript   #$# r  T_%&% I T[�<'�;
�< .sysoexecTEXT���     TEXT' o  TW�:�: 0 	thescript  �;  & o      �9�9 	0 notes  $ ()( l ``�8�7�6�8  �7  �6  ) *+* r  `�,-, c  `�./. l `�0�5�40 6`�121 2  `e�3
�3 
rkdp2 G  h343 l ir5�2�15 ? ir676 1  jn�0
�0 
rkmr7 m  oq�/�/ �2  �1  4 l s~8�.�-8 = s~9:9 1  tx�,
�, 
rkvc: m  y}�+
�+ rkclrkRD�.  �-  �5  �4  / m  ���*
�* 
list- o      �)�) 
0 cursel  + ;<; r  ��=>= c  ��?@? l ��A�(�'A 6 ��BCB 2  ���&
�& 
rkdpC E  ��DED n  ��FGF 1  ���%
�% 
pnamG 2  ���$
�$ 
rkkwE m  ��HH �II  B o r d e r F X�(  �'  @ m  ���#
�# 
list> o      �"�" 0 watermarkedsel  < JKJ l ���!� ��!  �   �  K L�L n  ��MNM I  ������ 0 
seturgency 
setUrgency�  �  N o  ���� *0 loadedexportlibrary loadedExportLibrary�  	 4  )1�O
� 
rkpjO o  -0�� 0 pr   m  #&PP�                                                                                  fstp  alis    P  
Subversion                 �1ubH+     OAperture.app                                                    
�p��        ����  	                Applications    �1�      �~�Z       O  %Subversion:Applications: Aperture.app     A p e r t u r e . a p p   
 S u b v e r s i o n  Applications/Aperture.app   / ��  �F  �E   QRQ l     ����  �  �  R STS l     ����  �  �  T UVU l     ����  �  �  V WXW l     �YZ�  Y ) #**** Backup any existing files ****   Z �[[ F * * * *   B a c k u p   a n y   e x i s t i n g   f i l e s   * * * *X \]\ l     �^_�  ^    check if backupdir exists   _ �`` 4   c h e c k   i f   b a c k u p d i r   e x i s t s] aba l ��c��c Z  ��de�
�	d H  ��ff n  ��ghg I  ���i�� 0 
fileexists 
fileExistsi j�j n  ��klk 1  ���
� 
psxpl o  ���� 0 	backupdir 	BackupDir�  �  h o  ���� *0 loadedexportlibrary loadedExportLibrarye k  ��mm non r  ��pqp b  ��rsr m  ��tt �uu  m k d i r   - p  s l ��v��v n  ��wxw 1  ��� 
�  
psxpx o  ������ 0 	backupdir 	BackupDir�  �  q o      ���� 0 	thescript  o y��y I ����z��
�� .sysoexecTEXT���     TEXTz o  ������ 0 	thescript  ��  ��  �
  �	  �  �  b {|{ l     ��������  ��  ��  | }~} l ����� Z  �������� n  ����� I  ��������� 0 
fileexists 
fileExists� ���� n  ����� 1  ����
�� 
psxp� o  ������ 0 directorypath  ��  ��  � o  ������ *0 loadedexportlibrary loadedExportLibrary� k  ��� ��� r  ����� b  ����� b  ����� b  ����� m  ���� ���  m v  � o  ������ 0 directorypath  � m  ���� ���   � l �������� n  ����� 1  ����
�� 
psxp� o  ������ 0 prbackupdir PrBackupDir��  ��  � o      ���� 0 	thescript  � ���� I ������
�� .sysoexecTEXT���     TEXT� o  � ���� 0 	thescript  ��  ��  ��  ��  ��  ��  ~ ��� l     ��������  ��  ��  � ��� l 	$������ r  	$��� b  	 ��� b  	��� b  	��� b  	��� b  	��� m  	�� ���  m k d i r   - p  � o  ���� 0 
thumbspath  � m  �� ���  ;   m k d i r   - p  � o  ���� 0 watermarkedpath  � m  �� ���  / t m p   ;   m k d i r  � o  ���� 0 masterspath mastersPath� o      ���� 0 	thescript  ��  ��  � ��� l     ������  � M Gmaking thumbspath with the -p option causes directorypath to be created   � ��� � m a k i n g   t h u m b s p a t h   w i t h   t h e   - p   o p t i o n   c a u s e s   d i r e c t o r y p a t h   t o   b e   c r e a t e d� ��� l %,������ I %,�����
�� .sysoexecTEXT���     TEXT� o  %(���� 0 	thescript  ��  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  �   **** export the notes ****   � ��� 4 * * * *   e x p o r t   t h e   n o t e s   * * * *� ��� l -D������ r  -D��� b  -@��� b  -<��� b  -8��� b  -4��� m  -0�� ���  e c h o   "� o  03���� 	0 notes  � m  47�� ���  " >  � o  8;���� 0 directorypath  � m  <?�� ���  / n o t e s . t x t� o      ���� 0 	thescript  ��  ��  � ��� l EL������ I EL�����
�� .sysoexecTEXT���     TEXT� o  EH���� 0 	thescript  ��  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  �  **** Export the pics ****   � ��� 2 * * * *   E x p o r t   t h e   p i c s   * * * *� ��� l Mc������ n  Mc��� I  Nc������� 0 
exportpics 
exportPics� ��� o  NQ���� 
0 cursel  � ��� o  QT���� 0 
libdbposix 
libDBPOSIX� ��� o  TW���� 0 directorypath  � ��� o  WZ���� 0 
thumbspath  � ���� o  Z]���� 0 watermarkedpath  ��  ��  � o  MN���� *0 loadedexportlibrary loadedExportLibrary��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  � \ V**** Export the hand watermarked pics to replace the automatically generated ones ****   � ��� � * * * *   E x p o r t   t h e   h a n d   w a t e r m a r k e d   p i c s   t o   r e p l a c e   t h e   a u t o m a t i c a l l y   g e n e r a t e d   o n e s   * * * *� ��� l dr������ n  dr��� I  er������� 60 exporthandwatermarkedpics exportHandWatermarkedPics� ��� o  eh���� 0 watermarkedsel  � � � o  hk���� 0 
libdbposix 
libDBPOSIX  �� o  kn���� 0 watermarkedpath  ��  ��  � o  de���� *0 loadedexportlibrary loadedExportLibrary��  ��  �  l     ��������  ��  ��    l     ����   $ **** Add links to masters ****    � < * * * *   A d d   l i n k s   t o   m a s t e r s   * * * * 	
	 l s����� n  s� I  t������� 0 addlinks addLinks  o  tw���� 
0 cursel    o  wz���� 0 masterspath mastersPath �� o  z}���� 0 
libdbposix 
libDBPOSIX��  ��   o  st���� *0 loadedexportlibrary loadedExportLibrary��  ��  
  l     ��������  ��  ��   �� l     ��������  ��  ��  ��       �� "��   ������ 	0 p_sql  
�� .aevtoappnull  �   � **** ��������
�� .aevtoappnull  �   � **** k    �  
    ,  3    :!!  ?""  F##  V$$  ]%%  f&&  p''  z((  �))  �**  �++  �,,  �--  �..  �//  �00  �11 22 a33 }44 �55 �66 �77 �88 �99 �:: 	����  ��  ��     T���������� ������������������� P�~ [�} b�|�{�z�y�x�w�v�u�t�s�r�q�p ��o�n � � ��m ��l ��k ��j ��iP�h�g�f!�e�d�c�b;�a�`�_�^�]�\�[H�Z�Y�Xt���������W�V�U�T
�� 
alis
�� afdrscr�
�� 
rtyp
�� 
TEXT
�� .earsffdralis        afdr�� 0 librarypath libraryPath
�� .sysoloadscpt        file�� *0 loadedexportlibrary loadedExportLibrary�� 0 
getlibpath 
getLibPath�� 0 	g_libpath 	g_libPath
�� 
ret �� 0 theout theOut�� 0 	libcopied 	libCopied
�� 
psxp� 0 libposix libPOSIX�~ 0 
libdbposix 
libDBPOSIX�} 0 publishedpath PublishedPath�| 0 	backupdir 	BackupDir
�{ .misccurdldt    ��� null
�z 
year�y 0 curyear  
�x 
mnth�w 0 curmonth  
�v 
day �u 
0 curday  
�t 
time�s 0 curtime  �r 0 monthtointeger  �q 0 monthint  
�p 
leng�o 0 chooseproject chooseProject�n 0 pr  �m 0 directorypath  �l 0 prbackupdir PrBackupDir�k 0 masterspath mastersPath�j 0 
thumbspath  �i 0 watermarkedpath  
�h 
rkpj
�g 
strq
�f 
ID  �e 0 	thescript  
�d .sysoexecTEXT���     TEXT�c 	0 notes  
�b 
rkdp;  
�a 
rkmr
�` 
rkvc
�_ rkclrkRD
�^ 
list�] 
0 cursel  
�\ 
rkkw
�[ 
pnam�Z 0 watermarkedsel  �Y 0 
seturgency 
setUrgency�X 0 
fileexists 
fileExists�W �V 0 
exportpics 
exportPics�U 60 exporthandwatermarkedpics exportHandWatermarkedPics�T 0 addlinks addLinks���*����l �%/E�O�j E�O�j+ 	E�O�E�OfE�O��,E�O�a %�&E` Oa E` Oa E` O*j a ,�&E` O*j a ,�&E` O*j a ,�&E` O*j a ,�&E` O�_ k+ �&E`  O_  a !,k  a "_  %E`  Y hO�*j k+ #E` $O_ a %%_ %a &%_  %a '%_ $%E` (O_ a )%_ %_ %_ %_ %E` *O_ (a +%E` ,O_ (a -%E` .O_ (a /%E` 0Oa 1 �*a 2_ $/ }b   _ a 3,%a 4%*a 5,%a 6%E` 7O_ 7j 8E` 9O*a :-a ;[[a <,\Zm:\[a =,\Za >8B1a ?&E` @O*a :-a ;[a A-a B,\Za C@1a ?&E` DO�j+ EUUO�_ �,k+ F a G_ �,%E` 7O_ 7j 8Y hO�_ (�,k+ F "a H_ (%a I%_ *�,%E` 7O_ 7j 8Y hOa J_ .%a K%_ 0%a L%_ ,%E` 7O_ 7j 8Oa M_ 9%a N%_ (%a O%E` 7O_ 7j 8O�_ @_ _ (_ ._ 0a P+ QO�_ D_ _ 0m+ RO�_ @_ ,_ m+ S ascr  ��ޭ