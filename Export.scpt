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
TEXT � o      ���� 0 curtime  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � * $************************************    � � � � H * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * �  � � � l  � � ����� � Z   � � � ��� � � n   � � � � � I   � ��� ����� 0 folderexists   �  � � � o   � ����� 0 curyear   �  ��� � o   � ����� 0 curmonth  ��  ��   � o   � ����� *0 loadedexportlibrary loadedExportLibrary � r   � � � � � m   � ���
�� boovtrue � o      �� 0 monthexists  ��   � r   � � � � � m   � ��~
�~ boovfals � o      �}�} 0 monthexists  ��  ��   �  � � � l     �|�{�z�|  �{  �z   �  � � � l  � � ��y�x � r   � � � � � m   � � � � � � � $ * *   C h a n g e   m o n t h   * * � o      �w�w 0 changemonthmessage  �y  �x   �  � � � l  � � ��v�u � r   � � � � � m   � � � � � � � " * *   C h a n g e   y e a r   * * � o      �t�t 0 changeyearmessage  �v  �u   �  � � � l  � � ��s�r � r   � � � � � m   � ��q
�q boovfals � o      �p�p 0 choosenproject  �s  �r   �  � � � l  � � ��o�n � r   � � � � � o   � ��m�m 0 changemonthmessage   � o      �l�l 0 pr  �o  �n   �  � � � l     �k�j�i�k  �j  �i   �  � � � l  �� ��h�g � O   �� � � � V   �� � � � k   �� � �  � � � l  � ��f � ��f   � / )if curmonth is not changeyearmessage then    � � � � R i f   c u r m o n t h   i s   n o t   c h a n g e y e a r m e s s a g e   t h e n �  � � � Z   �, � ��e�d � o   � ��c�c 0 monthexists   � O   �( � � � O   �' � � � k   �& � �  � � � r   � � � � � m   � ��b
�b boovtrue � o      �a�a 0 choosenproject   �  � � � r   � � � � e   � � � � n   � � � � � 1   � ��`
�` 
pnam � 2   � ��_
�_ 
rkpj � o      �^�^ 0 x   �  � � � r   � � � o  �]�] 0 changemonthmessage   � n       � � �  ;  	
 � o  	�\�\ 0 x   �  � � � I �[ � �
�[ .gtqpchltns    @   @ ns   � o  �Z�Z 0 x   � �Y ��X
�Y 
prmp � m   � � � � �   C h o o s e   a   p r o j e c t�X   �  ��W � r  & � � � n  " � � � 4  "�V �
�V 
cobj � m   !�U�U  � 1  �T
�T 
rslt � o      �S�S 0 pr  �W   � 4   � ��R �
�R 
rkfl � o   � ��Q�Q 0 curmonth   � 4   � ��P �
�P 
rkfl � o   � ��O�O 0 curyear  �e  �d   �  � � � Z  -~ � ��N�M � = -4 � � � o  -0�L�L 0 pr   � o  03�K�K 0 changemonthmessage   � k  7z � �  � � � r  7<   m  78�J
�J boovfals o      �I�I 0 choosenproject   � �H O  =z k  Hy  r  HU	 n  HQ

 1  MQ�G
�G 
pnam 2  HM�F
�F 
rkfl	 o      �E�E 0 x    r  V^ o  VY�D�D 0 changeyearmessage   n        ;  \] o  Y\�C�C 0 x    I _l�B
�B .gtqpchltns    @   @ ns   o  _b�A�A 0 x   �@�?
�@ 
prmp m  eh �  c h o o s e   m o n t h�?   �> r  my n  mu 4  pu�=
�= 
cobj m  st�<�<  1  mp�;
�; 
rslt o      �:�: 0 curmonth  �>   4  =E�9
�9 
rkfl o  AD�8�8 0 curyear  �H  �N  �M   �  �7  Z  �!"�6#! = �$%$ o  ��5�5 0 curmonth  % o  ���4�4 0 changeyearmessage  " k  ��&& '(' r  ��)*) 6��+,+ n  ��-.- 1  ���3
�3 
pnam. 2  ���2
�2 
rkfl, F  ��/0/ H  ��11 E  ��232 1  ���1
�1 
pnam3 m  ��44 �55  -0 C  ��676 1  ���0
�0 
pnam7 m  ��88 �99  2* o      �/�/ 0 x  ( :;: l ���.<=�.  < J D Lazy programming. Must get round to fixing it before the year 3000.   = �>> �   L a z y   p r o g r a m m i n g .   M u s t   g e t   r o u n d   t o   f i x i n g   i t   b e f o r e   t h e   y e a r   3 0 0 0 .; ?@? I ���-AB
�- .gtqpchltns    @   @ ns  A o  ���,�, 0 x  B �+C�*
�+ 
prmpC m  ��DD �EE  c h o o s e   y e a r�*  @ FGF r  ��HIH n  ��JKJ 4  ���)L
�) 
cobjL m  ���(�( K 1  ���'
�' 
rsltI o      �&�& 0 curyear  G M�%M r  ��NON m  ���$
�$ boovfalsO o      �#�# 0 monthexists  �%  �6  # r  ��PQP m  ���"
�" boovtrueQ o      �!�! 0 monthexists  �7   � H   � �RR o   � �� �  0 choosenproject   � m   � �SS�                                                                                  fstp  alis    P  
Subversion                 �1ubH+     OAperture.app                                                    
�p��        ����  	                Applications    �1�      �~�Z       O  %Subversion:Applications: Aperture.app     A p e r t u r e . a p p   
 S u b v e r s i o n  Applications/Aperture.app   / ��  �h  �g   � TUT l     ����  �  �  U VWV l     ����  �  �  W XYX l     �Z[�  Z  ** Choose a project **   [ �\\ , * *   C h o o s e   a   p r o j e c t   * *Y ]^] l     �_`�  _ B <set pr to chooseProject(current date) of loadedExportLibrary   ` �aa x s e t   p r   t o   c h o o s e P r o j e c t ( c u r r e n t   d a t e )   o f   l o a d e d E x p o r t L i b r a r y^ bcb l     ����  �  �  c ded l ��f��f r  ��ghg c  ��iji n  ��klk I  ���m�� 0 monthtointeger  m n�n o  ���� 0 curmonth  �  �  l o  ���� *0 loadedexportlibrary loadedExportLibraryj m  ���
� 
TEXTh o      �� 0 monthint  �  �  e opo l �q��
q Z  �rs�	�r = ��tut n  ��vwv 1  ���
� 
lengw o  ���� 0 monthint  u m  ���� s r  �
xyx b  �z{z m  �|| �}}  0{ o  �� 0 monthint  y o      �� 0 monthint  �	  �  �  �
  p ~~ l     ��� �  �  �    ��� l     ��������  ��  ��  � ��� l .������ r  .��� b  *��� b  &��� b  "��� b  ��� b  ��� b  ��� o  ���� 0 publishedpath PublishedPath� m  �� ���  /� o  ���� 0 curyear  � m  �� ���  /� o  !���� 0 monthint  � m  "%�� ���  /� o  &)���� 0 pr  � o      ���� 0 directorypath directoryPath��  ��  � ��� l /J������ r  /J��� b  /F��� b  /B��� b  />��� b  /:��� b  /6��� o  /2���� 0 	backupdir 	BackupDir� m  25�� ���  /� o  69���� 0 curyear  � o  :=���� 0 curmonth  � o  >A���� 
0 curday  � o  BE���� 0 curtime  � o      ���� 0 prbackupdir PrBackupDir��  ��  � ��� l KV������ r  KV��� b  KR��� o  KN���� 0 directorypath directoryPath� m  NQ�� ���  / m a s t e r s� o      ���� 0 masterspath mastersPath��  ��  � ��� l Wb������ r  Wb��� b  W^��� o  WZ���� 0 directorypath directoryPath� m  Z]�� ���  / t h u m b s� o      ���� 0 
thumbspath 
thumbsPath��  ��  � ��� l cn������ r  cn��� b  cj��� o  cf���� 0 directorypath directoryPath� m  fi�� ���  / w a t e r m a r k e d� o      ���� "0 watermarkedpath watermarkedPath��  ��  � ��� l     ��������  ��  ��  � ��� l o ������ O  o ��� O  u���� k  ���� ��� l ��������  �   get the project notes   � ��� ,   g e t   t h e   p r o j e c t   n o t e s� ��� r  ����� b  ����� b  ����� b  ����� b  ����� o  ������ 	0 p_sql  � l �������� n  ����� 1  ����
�� 
strq� o  ������ 0 
libdbposix 
libDBPOSIX��  ��  � m  ���� ��� `   " s e l e c t   n o t e   f r o m   R K N O T E   w h e r e   A T T A C H E D T O U U I D = '� 1  ����
�� 
ID  � m  ���� ���  ' "� o      ���� 0 	thescript  � ��� r  ����� I �������
�� .sysoexecTEXT���     TEXT� o  ������ 0 	thescript  ��  � o      ���� 	0 notes  � ��� l ����������  ��  ��  � ��� r  ����� c  ����� l �������� 6����� 2  ����
�� 
rkdp� G  ����� l �������� ? ����� 1  ����
�� 
rkmr� m  ������ ��  ��  � l �������� = ����� 1  ����
�� 
rkvc� m  ����
�� rkclrkRD��  ��  ��  ��  � m  ����
�� 
list� o      ���� 
0 cursel  � � � r  �� c  �� l ������ 6 �� 2  ����
�� 
rkdp E  ��	 n  ��

 1  ����
�� 
pnam 2  ����
�� 
rkkw	 m  �� �  B o r d e r F X��  ��   m  ����
�� 
list o      ���� 0 watermarkedsel     l ����������  ��  ��   �� n  �� I  �������� 0 
seturgency 
setUrgency �� o  ������ 0 pr  ��  ��   o  ������ *0 loadedexportlibrary loadedExportLibrary��  � 4  u}��
�� 
rkpj o  y|���� 0 pr  � m  or�                                                                                  fstp  alis    P  
Subversion                 �1ubH+     OAperture.app                                                    
�p��        ����  	                Applications    �1�      �~�Z       O  %Subversion:Applications: Aperture.app     A p e r t u r e . a p p   
 S u b v e r s i o n  Applications/Aperture.app   / ��  ��  ��  �  l     ��������  ��  ��    l     ��������  ��  ��    l     ��������  ��  ��    l     �� ��   ) #**** Backup any existing files ****     �!! F * * * *   B a c k u p   a n y   e x i s t i n g   f i l e s   * * * * "#" l     ��$%��  $    check if backupdir exists   % �&& 4   c h e c k   i f   b a c k u p d i r   e x i s t s# '(' l ()����) Z  (*+����* H  ,, n  -.- I  ��/���� 0 
fileexists 
fileExists/ 0��0 n  121 1  ��
�� 
psxp2 o  ���� 0 	backupdir 	BackupDir��  ��  . o  ���� *0 loadedexportlibrary loadedExportLibrary+ k  $33 454 r  676 b  898 m  :: �;;  m k d i r   - p  9 l <����< n  =>= 1  ��
�� 
psxp> o  ���� 0 	backupdir 	BackupDir��  ��  7 o      ���� 0 	thescript  5 ?��? I $��@��
�� .sysoexecTEXT���     TEXT@ o   ���� 0 	thescript  ��  ��  ��  ��  ��  ��  ( ABA l     ��������  ��  ��  B CDC l )WE����E Z  )WFG����F n  )3HIH I  *3��J���� 0 
fileexists 
fileExistsJ K��K n  */LML 1  -/��
�� 
psxpM o  *-���� 0 directorypath directoryPath��  ��  I o  )*���� *0 loadedexportlibrary loadedExportLibraryG k  6SNN OPO r  6KQRQ b  6GSTS b  6AUVU b  6=WXW m  69YY �ZZ  m v  X o  9<���� 0 directorypath directoryPathV m  =@[[ �\\   T l AF]����] n  AF^_^ 1  DF��
�� 
psxp_ o  AD�� 0 prbackupdir PrBackupDir��  ��  R o      �~�~ 0 	thescript  P `�}` I LS�|a�{
�| .sysoexecTEXT���     TEXTa o  LO�z�z 0 	thescript  �{  �}  ��  ��  ��  ��  D bcb l     �y�x�w�y  �x  �w  c ded l Xsf�v�uf r  Xsghg b  Xoiji b  Xkklk b  Xgmnm b  Xcopo b  X_qrq m  X[ss �tt  m k d i r   - p  r o  [^�t�t 0 
thumbspath 
thumbsPathp m  _buu �vv  ;   m k d i r   - p  n o  cf�s�s "0 watermarkedpath watermarkedPathl m  gjww �xx  / t m p   ;   m k d i r  j o  kn�r�r 0 masterspath mastersPathh o      �q�q 0 	thescript  �v  �u  e yzy l     �p{|�p  { M Gmaking thumbspath with the -p option causes directorypath to be created   | �}} � m a k i n g   t h u m b s p a t h   w i t h   t h e   - p   o p t i o n   c a u s e s   d i r e c t o r y p a t h   t o   b e   c r e a t e dz ~~ l t{��o�n� I t{�m��l
�m .sysoexecTEXT���     TEXT� o  tw�k�k 0 	thescript  �l  �o  �n   ��� l     �j�i�h�j  �i  �h  � ��� l     �g���g  �   **** export the notes ****   � ��� 4 * * * *   e x p o r t   t h e   n o t e s   * * * *� ��� l |���f�e� r  |���� b  |���� b  |���� b  |���� b  |���� m  |�� ���  e c h o   "� o  ��d�d 	0 notes  � m  ���� ���  " >  � o  ���c�c 0 directorypath directoryPath� m  ���� ���  / n o t e s . t x t� o      �b�b 0 	thescript  �f  �e  � ��� l ����a�`� I ���_��^
�_ .sysoexecTEXT���     TEXT� o  ���]�] 0 	thescript  �^  �a  �`  � ��� l     �\�[�Z�\  �[  �Z  � ��� l     �Y���Y  �  **** Export the pics ****   � ��� 2 * * * *   E x p o r t   t h e   p i c s   * * * *� ��� l ����X�W� n  ����� I  ���V��U�V 0 
exportpics 
exportPics� ��� o  ���T�T 
0 cursel  � ��� o  ���S�S 0 
libdbposix 
libDBPOSIX� ��� o  ���R�R 0 directorypath directoryPath� ��� o  ���Q�Q 0 
thumbspath 
thumbsPath� ��P� o  ���O�O "0 watermarkedpath watermarkedPath�P  �U  � o  ���N�N *0 loadedexportlibrary loadedExportLibrary�X  �W  � ��� l     �M�L�K�M  �L  �K  � ��� l     �J���J  � \ V**** Export the hand watermarked pics to replace the automatically generated ones ****   � ��� � * * * *   E x p o r t   t h e   h a n d   w a t e r m a r k e d   p i c s   t o   r e p l a c e   t h e   a u t o m a t i c a l l y   g e n e r a t e d   o n e s   * * * *� ��� l ����I�H� n  ����� I  ���G��F�G 60 exporthandwatermarkedpics exportHandWatermarkedPics� ��� o  ���E�E 0 watermarkedsel  � ��� o  ���D�D 0 
libdbposix 
libDBPOSIX� ��C� o  ���B�B "0 watermarkedpath watermarkedPath�C  �F  � o  ���A�A *0 loadedexportlibrary loadedExportLibrary�I  �H  � ��� l     �@�?�>�@  �?  �>  � ��� l     �=���=  � $ **** Add links to masters ****   � ��� < * * * *   A d d   l i n k s   t o   m a s t e r s   * * * *� ��� l ����<�;� n  ����� I  ���:��9�: 0 addlinks addLinks� ��� o  ���8�8 
0 cursel  � ��� o  ���7�7 0 masterspath mastersPath� ��6� o  ���5�5 0 
libdbposix 
libDBPOSIX�6  �9  � o  ���4�4 *0 loadedexportlibrary loadedExportLibrary�<  �;  � ��� l     �3�2�1�3  �2  �1  � ��0� l     �/�.�-�/  �.  �-  �0       �,� "��,  � �+�*�+ 	0 p_sql  
�* .aevtoappnull  �   � ****� �)��(�'���&
�) .aevtoappnull  �   � ****� k    ���  
��  ��  ,��  3��  :��  ?��  F��  V��  ]��  f��  p��  z��  ���  ���  ���  ���  ���  ���  ��� d�� o�� ��� ��� ��� ��� ��� ��� '�� C�� d   ~ � � � � ��%�%  �(  �'  �  � e�$�#�"�!�  ���������� P� [� b����������
�	� �� ����S���� �� �������48D������|�������������������������������������������������:Y[suw�����������
�$ 
alis
�# afdrscr�
�" 
rtyp
�! 
TEXT
�  .earsffdralis        afdr� 0 librarypath libraryPath
� .sysoloadscpt        file� *0 loadedexportlibrary loadedExportLibrary� 0 
getlibpath 
getLibPath� 0 	g_libpath 	g_libPath
� 
ret � 0 theout theOut� 0 	libcopied 	libCopied
� 
psxp� 0 libposix libPOSIX� 0 
libdbposix 
libDBPOSIX� 0 publishedpath PublishedPath� 0 	backupdir 	BackupDir
� .misccurdldt    ��� null
� 
year� 0 curyear  
� 
mnth� 0 curmonth  
� 
day � 
0 curday  
� 
time�
 0 curtime  �	 0 folderexists  � 0 monthexists  � 0 changemonthmessage  � 0 changeyearmessage  � 0 choosenproject  � 0 pr  
� 
rkfl
� 
rkpj
� 
pnam�  0 x  
�� 
prmp
�� .gtqpchltns    @   @ ns  
�� 
rslt
�� 
cobj  �� 0 monthtointeger  �� 0 monthint  
�� 
leng�� 0 directorypath directoryPath�� 0 prbackupdir PrBackupDir�� 0 masterspath mastersPath�� 0 
thumbspath 
thumbsPath�� "0 watermarkedpath watermarkedPath
�� 
strq
�� 
ID  �� 0 	thescript  
�� .sysoexecTEXT���     TEXT�� 	0 notes  
�� 
rkdp
�� 
rkmr
�� 
rkvc
�� rkclrkRD
�� 
list�� 
0 cursel  
�� 
rkkw�� 0 watermarkedsel  �� 0 
seturgency 
setUrgency�� 0 
fileexists 
fileExists�� �� 0 
exportpics 
exportPics�� 60 exporthandwatermarkedpics exportHandWatermarkedPics�� 0 addlinks addLinks�&�*����l �%/E�O�j E�O�j+ 	E�O�E�OfE�O��,E�O�a %�&E` Oa E` Oa E` O*j a ,�&E` O*j a ,�&E` O*j a ,�&E` O*j a ,�&E` O�_ _ l+  
eE`  Y fE`  Oa !E` "Oa #E` $OfE` %O_ "E` &Oa 'h_ %_   U*a (_ / F*a (_ / :eE` %O*a )-a *,EE` +O_ "_ +6FO_ +a ,a -l .O_ /a 0k/E` &UUY hO_ &_ "  HfE` %O*a (_ / 3*a (-a *,E` +O_ $_ +6FO_ +a ,a 1l .O_ /a 0k/E` UY hO_ _ $  Q*a (-a *,a 2[[a *,\Za 3@C\[a *,\Za 4>A1E` +O_ +a ,a 5l .O_ /a 0k/E` OfE`  Y eE`  [OY��UO�_ k+ 6�&E` 7O_ 7a 8,k  a 9_ 7%E` 7Y hO_ a :%_ %a ;%_ 7%a <%_ &%E` =O_ a >%_ %_ %_ %_ %E` ?O_ =a @%E` AO_ =a B%E` CO_ =a D%E` EOa ' �*a )_ &/ �b   _ a F,%a G%*a H,%a I%E` JO_ Jj KE` LO*a M-a 2[[a N,\Zm:\[a O,\Za P8B1a Q&E` RO*a M-a 2[a S-a *,\Za T@1a Q&E` UO�_ &k+ VUUO�_ �,k+ W a X_ �,%E` JO_ Jj KY hO�_ =�,k+ W "a Y_ =%a Z%_ ?�,%E` JO_ Jj KY hOa [_ C%a \%_ E%a ]%_ A%E` JO_ Jj KOa ^_ L%a _%_ =%a `%E` JO_ Jj KO�_ R_ _ =_ C_ Ea a+ bO�_ U_ _ Em+ cO�_ R_ A_ m+ d ascr  ��ޭ