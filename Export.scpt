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
 l     ��������  ��  ��        l     ��  ��    Z TPlay with these to make the initial dialog box start with a different year and month     �   � P l a y   w i t h   t h e s e   t o   m a k e   t h e   i n i t i a l   d i a l o g   b o x   s t a r t   w i t h   a   d i f f e r e n t   y e a r   a n d   m o n t h      l     ����  r         c     	    n         1    ��
�� 
year  l     ����  I    ������
�� .misccurdldt    ��� null��  ��  ��  ��    m    ��
�� 
TEXT  o      ���� 0 curyear  ��  ��        l     ��  ��     set curyear to "2012"     �   * s e t   c u r y e a r   t o   " 2 0 1 2 "     !   l    "���� " r     # $ # c     % & % n     ' ( ' m    ��
�� 
mnth ( l    )���� ) I   ������
�� .misccurdldt    ��� null��  ��  ��  ��   & m    ��
�� 
TEXT $ o      ���� 0 curmonth  ��  ��   !  * + * l     �� , -��   ,   set curmonth to "December"    - � . . 4 s e t   c u r m o n t h   t o   " D e c e m b e r " +  / 0 / l     ��������  ��  ��   0  1 2 1 l   & 3���� 3 r    & 4 5 4 4    $�� 6
�� 
alis 6 l   # 7���� 7 b    # 8 9 8 l   ! :���� : I   !�� ; <
�� .earsffdralis        afdr ; m    ��
�� afdrscr� < �� =��
�� 
rtyp = m    ��
�� 
TEXT��  ��  ��   9 m   ! " > > � ? ? P A p p l i c a t i o n s : A p e r t u r e : E x p o r t L i b r a r y . s c p t��  ��   5 o      ���� 0 librarypath libraryPath��  ��   2  @ A @ l  ' . B���� B r   ' . C D C I  ' ,�� E��
�� .sysoloadscpt        file E o   ' (���� 0 librarypath libraryPath��   D o      ���� *0 loadedexportlibrary loadedExportLibrary��  ��   A  F G F j     �� H�� 	0 p_sql   H m      I I � J J " / u s r / b i n / s q l i t e 3   G  K L K p     M M ������ 0 dbpath DBPath��   L  N O N p     P P ������ 0 	g_libpath 	g_libPath��   O  Q R Q l     ��������  ��  ��   R  S T S l  / 6 U���� U r   / 6 V W V n   / 4 X Y X I   0 4�������� 0 
getlibpath 
getLibPath��  ��   Y o   / 0���� *0 loadedexportlibrary loadedExportLibrary W o      ���� 0 	g_libpath 	g_libPath��  ��   T  Z [ Z l  7 > \���� \ r   7 > ] ^ ] o   7 :��
�� 
ret  ^ o      ���� 0 theout theOut��  ��   [  _ ` _ l     ��������  ��  ��   `  a b a l  ? D c���� c r   ? D d e d m   ? @��
�� boovfals e o      ���� 0 	libcopied 	libCopied��  ��   b  f g f l  E N h���� h r   E N i j i n   E J k l k 1   F J��
�� 
psxp l o   E F���� 0 	g_libpath 	g_libPath j o      ���� 0 libposix libPOSIX��  ��   g  m n m l  O \ o���� o r   O \ p q p c   O X r s r l  O V t���� t b   O V u v u o   O R���� 0 libposix libPOSIX v m   R U w w � x x , / D a t a b a s e / L i b r a r y . a p d b��  ��   s m   V W��
�� 
TEXT q o      ���� 0 
libdbposix 
libDBPOSIX��  ��   n  y z y l     ��������  ��  ��   z  { | { l     ��������  ��  ��   |  } ~ } l  ] d ����  r   ] d � � � m   ] ` � � � � � < / U s e r s / i a i n / P i c t u r e s / P u b l i s h e d � o      ���� 0 publishedpath PublishedPath��  ��   ~  � � � l     �� � ���   � ' !set BackupDir to "/tmp/Published"    � � � � B s e t   B a c k u p D i r   t o   " / t m p / P u b l i s h e d " �  � � � l     ��������  ��  ��   �  � � � l  e t ����� � r   e t � � � c   e p � � � n   e n � � � 1   j n��
�� 
day  � l  e j ����� � I  e j������
�� .misccurdldt    ��� null��  ��  ��  ��   � m   n o��
�� 
TEXT � o      ���� 
0 curday  ��  ��   �  � � � l  u � ����� � r   u � � � � c   u � � � � n   u ~ � � � 1   z ~��
�� 
time � l  u z ����� � I  u z������
�� .misccurdldt    ��� null��  ��  ��  ��   � m   ~ ��
�� 
TEXT � o      ���� 0 curtime  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � * $************************************    � � � � H * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * �  � � � l  � � ����� � Z   � � � ��� � � n   � � � � � I   � �� ��~� 0 folderexists   �  � � � o   � ��}�} 0 curyear   �  ��| � o   � ��{�{ 0 curmonth  �|  �~   � o   � ��z�z *0 loadedexportlibrary loadedExportLibrary � r   � � � � � m   � ��y
�y boovtrue � o      �x�x 0 monthexists  ��   � r   � � � � � m   � ��w
�w boovfals � o      �v�v 0 monthexists  ��  ��   �  � � � l     �u�t�s�u  �t  �s   �  � � � l  � � ��r�q � r   � � � � � m   � � � � � � � $ * *   C h a n g e   m o n t h   * * � o      �p�p 0 changemonthmessage  �r  �q   �  � � � l  � � ��o�n � r   � � � � � m   � � � � � � � " * *   C h a n g e   y e a r   * * � o      �m�m 0 changeyearmessage  �o  �n   �  � � � l  � � ��l�k � r   � � � � � m   � ��j
�j boovfals � o      �i�i 0 choosenproject  �l  �k   �  � � � l  � � ��h�g � r   � � � � � o   � ��f�f 0 changemonthmessage   � o      �e�e 0 pr  �h  �g   �  � � � l     �d�c�b�d  �c  �b   �  � � � l  �� ��a�` � O   �� � � � V   �� � � � k   �� � �  � � � l  � ��_ � ��_   � / )if curmonth is not changeyearmessage then    � � � � R i f   c u r m o n t h   i s   n o t   c h a n g e y e a r m e s s a g e   t h e n �  � � � Z   �( � ��^�] � o   � ��\�\ 0 monthexists   � O   �$ � � � O   �# � � � k   �" � �  � � � r   � � � � � m   � ��[
�[ boovtrue � o      �Z�Z 0 choosenproject   �  � � � r   � � � � � e   � � � � n   � � � � � 1   � ��Y
�Y 
pnam � 2   � ��X
�X 
rkpj � o      �W�W 0 x   �  � � � r   � � � � � o   � ��V�V 0 changemonthmessage   � n       � � �  ;   � � � o   � ��U�U 0 x   �  � � � I  �T � �
�T .gtqpchltns    @   @ ns   � o   �S�S 0 x   � �R ��Q
�R 
prmp � m  	 � � � � �   C h o o s e   a   p r o j e c t�Q   �    r   n   4  �P
�P 
cobj m  �O�O  1  �N
�N 
rslt o      �M�M 0 pr   �L I "�K�J
�K .ascrcmnt****      � **** o  �I�I 0 pr  �J  �L   � 4   � ��H	
�H 
rkfl	 o   � ��G�G 0 curmonth   � 4   � ��F

�F 
rkfl
 o   � ��E�E 0 curyear  �^  �]   �  Z  )v�D�C = )0 o  ),�B�B 0 pr   o  ,/�A�A 0 changemonthmessage   k  3r  r  38 m  34�@
�@ boovfals o      �?�? 0 choosenproject   �> O  9r k  Bq  r  BO n  BK 1  GK�=
�= 
pnam 2  BG�<
�< 
rkfl o      �;�; 0 x    !  r  PX"#" o  PS�:�: 0 changeyearmessage  # n      $%$  ;  VW% o  SV�9�9 0 x  ! &'& I Yf�8()
�8 .gtqpchltns    @   @ ns  ( o  Y\�7�7 0 x  ) �6*�5
�6 
prmp* m  _b++ �,,  c h o o s e   m o n t h�5  ' -�4- r  gq./. n  go010 4  jo�32
�3 
cobj2 m  mn�2�2 1 1  gj�1
�1 
rslt/ o      �0�0 0 curmonth  �4   4  9?�/3
�/ 
rkfl3 o  =>�.�. 0 curyear  �>  �D  �C   4�-4 Z  w�56�,75 = w|898 o  wx�+�+ 0 curmonth  9 o  x{�*�* 0 changeyearmessage  6 k  �:: ;<; r  �=>= 6�?@? n  �ABA 1  ���)
�) 
pnamB 2  ��(
�( 
rkfl@ F  ��CDC H  ��EE E  ��FGF 1  ���'
�' 
pnamG m  ��HH �II  -D C  ��JKJ 1  ���&
�& 
pnamK m  ��LL �MM  2> o      �%�% 0 x  < NON l ���$PQ�$  P J D Lazy programming. Must get round to fixing it before the year 3000.   Q �RR �   L a z y   p r o g r a m m i n g .   M u s t   g e t   r o u n d   t o   f i x i n g   i t   b e f o r e   t h e   y e a r   3 0 0 0 .O STS I ���#UV
�# .gtqpchltns    @   @ ns  U o  ���"�" 0 x  V �!W� 
�! 
prmpW m  ��XX �YY  c h o o s e   y e a r�   T Z[Z r  ��\]\ n  ��^_^ 4  ���`
� 
cobj` m  ���� _ 1  ���
� 
rslt] o      �� 0 curyear  [ a�a r  ��bcb m  ���
� boovfalsc o      �� 0 monthexists  �  �,  7 r  ��ded m  ���
� boovtruee o      �� 0 monthexists  �-   � H   � �ff o   � ��� 0 choosenproject   � m   � �gg�                                                                                  fstp  alis    P  
Subversion                 �1ubH+  QڶAperture.app                                                   X28Ψ�        ����  	                Applications    �1�      ΨU�    Qڶ  %Subversion:Applications: Aperture.app     A p e r t u r e . a p p   
 S u b v e r s i o n  Applications/Aperture.app   / ��  �a  �`   � hih l     ����  �  �  i jkj l ��l��l r  ��mnm c  ��opo n  ��qrq I  ���s�� 0 monthtointeger  s t�t o  ���� 0 curmonth  �  �  r o  ���� *0 loadedexportlibrary loadedExportLibraryp m  ���
� 
TEXTn o      �
�
 0 monthint  �  �  k uvu l � w�	�w Z  � xy��x = ��z{z n  ��|}| 1  ���
� 
leng} o  ���� 0 monthint  { m  ���� y r  ��~~ b  ����� m  ���� ���  0� o  ���� 0 monthint   o      �� 0 monthint  �  �  �	  �  v ��� l     � �����   ��  ��  � ��� l ������ r  ��� b  ��� b  ��� b  
��� b  ��� o  ���� 0 curyear  � m  �� ���  /� o  	���� 0 monthint  � m  
�� ���  /� o  ���� 0 pr  � o      ���� 0 ymp  ��  ��  � ��� l &������ r  &��� b  "��� b  ��� o  ���� 0 publishedpath PublishedPath� m  �� ���  / f u l l s i z e /� o  !���� 0 ymp  � o      ���� 0 fullsizepath fullsizePath��  ��  � ��� l '6������ r  '6��� b  '2��� b  '.��� o  '*���� 0 publishedpath PublishedPath� m  *-�� ���  / l a r g e /� o  .1���� 0 ymp  � o      ���� 0 	largepath 	largePath��  ��  � ��� l 7F������ r  7F��� b  7B��� b  7>��� o  7:���� 0 publishedpath PublishedPath� m  :=�� ���  / m a s t e r s /� o  >A���� 0 ymp  � o      ���� 0 masterspath mastersPath��  ��  � ��� l GV������ r  GV��� b  GR��� b  GN��� o  GJ���� 0 publishedpath PublishedPath� m  JM�� ���  / t h u m b s /� o  NQ���� 0 ymp  � o      ���� 0 
thumbspath 
thumbsPath��  ��  � ��� l Wf������ r  Wf��� b  Wb��� b  W^��� o  WZ���� 0 publishedpath PublishedPath� m  Z]�� ���  / m e d i u m /� o  ^a���� 0 ymp  � o      ���� 0 
mediumpath 
mediumPath��  ��  � ��� l gv������ r  gv��� b  gr��� b  gn��� o  gj���� 0 publishedpath PublishedPath� m  jm�� ���  /� o  nq���� 0 ymp  � o      ���� 0 rootpath rootPath��  ��  � ��� l     ��������  ��  ��  � ��� l w������ O  w��� O  }��� O  ���� O  � ��� k  ���� ��� l ��������  �   get the project notes   � ��� ,   g e t   t h e   p r o j e c t   n o t e s� ��� r  ����� b  ����� b  ����� b  ����� b  ����� o  ������ 	0 p_sql  � l �������� n  ����� 1  ����
�� 
strq� o  ������ 0 
libdbposix 
libDBPOSIX��  ��  � m  ���� ��� `   " s e l e c t   n o t e   f r o m   R K N O T E   w h e r e   A T T A C H E D T O U U I D = '� 1  ����
�� 
ID  � m  ���� ���  ' "� o      ���� 0 	thescript  � � � r  �� I ������
�� .sysoexecTEXT���     TEXT o  ������ 0 	thescript  ��   o      ���� 	0 notes     I ������
�� .ascrcmnt****      � **** o  ������ 0 	thescript  ��    l ����������  ��  ��   	
	 r  �� c  �� l ������ 6�� 2  ����
�� 
rkdp G  �� l ������ ? �� 1  ����
�� 
rkmr m  ������ ��  ��   l ������ = �� 1  ����
�� 
rkvc m  ����
�� rkclrkRD��  ��  ��  ��   m  ����
�� 
list o      ���� 
0 cursel  
  l ����������  ��  ��   �� n  �� I  �������� 0 
seturgency 
setUrgency  ��  o  ������ 0 pr  ��  ��   o  ������ *0 loadedexportlibrary loadedExportLibrary��  � 4  ����!
�� 
rkpj! o  ������ 0 pr  � 4  ����"
�� 
rkfl" o  ������ 0 curmonth  � 4  }���#
�� 
rkfl# o  ������ 0 curyear  � m  wz$$�                                                                                  fstp  alis    P  
Subversion                 �1ubH+  QڶAperture.app                                                   X28Ψ�        ����  	                Applications    �1�      ΨU�    Qڶ  %Subversion:Applications: Aperture.app     A p e r t u r e . a p p   
 S u b v e r s i o n  Applications/Aperture.app   / ��  ��  ��  � %&% l     ��������  ��  ��  & '(' l     ��)*��  )  delete the old versions   * �++ . d e l e t e   t h e   o l d   v e r s i o n s( ,-, l *.����. Z  */0����/ n  121 I  ��3���� 0 
fileexists 
fileExists3 4��4 n  565 1  ��
�� 
psxp6 o  ���� 0 fullsizepath fullsizePath��  ��  2 o  ���� *0 loadedexportlibrary loadedExportLibrary0 k  &77 898 r  :;: b  <=< m  >> �??  r m   - r  = o  ���� 0 fullsizepath fullsizePath; o      ���� 0 	thescript  9 @��@ I &��A��
�� .sysoexecTEXT���     TEXTA o  "���� 0 	thescript  ��  ��  ��  ��  ��  ��  - BCB l     ��������  ��  ��  C DED l +QF����F Z  +QGH����G n  +7IJI I  ,7��K���� 0 
fileexists 
fileExistsK L��L n  ,3MNM 1  /3��
�� 
psxpN o  ,/���� 0 
thumbspath 
thumbsPath��  ��  J o  +,���� *0 loadedexportlibrary loadedExportLibraryH k  :MOO PQP r  :ERSR b  :ATUT m  :=VV �WW  r m   - r  U o  =@���� 0 
thumbspath 
thumbsPathS o      ���� 0 	thescript  Q X��X I FM��Y��
�� .sysoexecTEXT���     TEXTY o  FI���� 0 	thescript  ��  ��  ��  ��  ��  ��  E Z[Z l     ��~�}�  �~  �}  [ \]\ l Rx^�|�{^ Z  Rx_`�z�y_ n  R^aba I  S^�xc�w�x 0 
fileexists 
fileExistsc d�vd n  SZefe 1  VZ�u
�u 
psxpf o  SV�t�t 0 masterspath mastersPath�v  �w  b o  RS�s�s *0 loadedexportlibrary loadedExportLibrary` k  atgg hih r  aljkj b  ahlml m  adnn �oo  r m   - r  m o  dg�r�r 0 masterspath mastersPathk o      �q�q 0 	thescript  i p�pp I mt�oq�n
�o .sysoexecTEXT���     TEXTq o  mp�m�m 0 	thescript  �n  �p  �z  �y  �|  �{  ] rsr l     �l�k�j�l  �k  �j  s tut l y�v�i�hv Z  y�wx�g�fw n  y�yzy I  z��e{�d�e 0 
fileexists 
fileExists{ |�c| n  z�}~} 1  }��b
�b 
psxp~ o  z}�a�a 0 
mediumpath 
mediumPath�c  �d  z o  yz�`�` *0 loadedexportlibrary loadedExportLibraryx k  �� ��� r  ����� b  ����� m  ���� ���  r m   - r  � o  ���_�_ 0 
mediumpath 
mediumPath� o      �^�^ 0 	thescript  � ��]� I ���\��[
�\ .sysoexecTEXT���     TEXT� o  ���Z�Z 0 	thescript  �[  �]  �g  �f  �i  �h  u ��� l     �Y�X�W�Y  �X  �W  � ��� l ����V�U� Z  �����T�S� n  ����� I  ���R��Q�R 0 
fileexists 
fileExists� ��P� n  ����� 1  ���O
�O 
psxp� o  ���N�N 0 	largepath 	largePath�P  �Q  � o  ���M�M *0 loadedexportlibrary loadedExportLibrary� k  ���� ��� r  ����� b  ����� m  ���� ���  r m   - r  � o  ���L�L 0 	largepath 	largePath� o      �K�K 0 	thescript  � ��J� I ���I��H
�I .sysoexecTEXT���     TEXT� o  ���G�G 0 	thescript  �H  �J  �T  �S  �V  �U  � ��� l     �F�E�D�F  �E  �D  � ��� l ����C�B� Z  �����A�@� n  ����� I  ���?��>�? 0 
fileexists 
fileExists� ��=� n  ����� 1  ���<
�< 
psxp� o  ���;�; 0 rootpath rootPath�=  �>  � o  ���:�: *0 loadedexportlibrary loadedExportLibrary� k  ���� ��� r  ����� b  ����� m  ���� ���  r m   - r  � o  ���9�9 0 rootpath rootPath� o      �8�8 0 	thescript  � ��7� I ���6��5
�6 .sysoexecTEXT���     TEXT� o  ���4�4 0 	thescript  �5  �7  �A  �@  �C  �B  � ��� l     �3�2�1�3  �2  �1  � ��� l     �0���0  �   make the directories   � ��� *   m a k e   t h e   d i r e c t o r i e s� ��� l �!��/�.� r  �!��� b  ���� b  ���� b  ���� b  ���� b  ���� b  �	��� b  ���� b  ���� b  ����� b  ����� b  ����� m  ���� ���  m k d i r   - p  � o  ���-�- 0 
thumbspath 
thumbsPath� m  ���� ���  ;   m k d i r   - p  � o  ���,�, 0 
mediumpath 
mediumPath� m  � �� ���  ;   m k d i r   - p  � o  �+�+ 0 masterspath mastersPath� m  �� ���  ;   m k d i r   - p  � o  	�*�* 0 fullsizepath fullsizePath� m  �� ���  ;   m k d i r   - p  � o  �)�) 0 rootpath rootPath� m  �� ���  ;   m k d i r   - p  � o  �(�( 0 	largepath 	largePath� o      �'�' 0 	thescript  �/  �.  � ��� l     �&���&  � L Fmaking thumbspath with the -p option causes fullsizePath to be created   � ��� � m a k i n g   t h u m b s p a t h   w i t h   t h e   - p   o p t i o n   c a u s e s   f u l l s i z e P a t h   t o   b e   c r e a t e d� ��� l ")��%�$� I ")�#��"
�# .sysoexecTEXT���     TEXT� o  "%�!�! 0 	thescript  �"  �%  �$  � ��� l     � ���   �  �  � ��� l     ����  �  **** Export the pics ****   � ��� 2 * * * *   E x p o r t   t h e   p i c s   * * * *� ��� l *C���� n  *C��� I  +C���� 0 
exportpics 
exportPics� ��� o  +.�� 
0 cursel  �    o  .1�� 0 
libdbposix 
libDBPOSIX  o  14�� 0 	largepath 	largePath  o  47�� 0 
thumbspath 
thumbsPath  o  7:�� 0 
mediumpath 
mediumPath � o  :=�� 0 fullsizepath fullsizePath�  �  � o  *+�� *0 loadedexportlibrary loadedExportLibrary�  �  � 	
	 l     ����  �  �  
  l     ��   $ **** Add links to masters ****    � < * * * *   A d d   l i n k s   t o   m a s t e r s   * * * *  l DR�� n  DR I  ER�
�	�
 0 addlinks addLinks  o  EH�� 
0 cursel    o  HK�� 0 masterspath mastersPath � o  KN�� 0 
libdbposix 
libDBPOSIX�  �	   o  DE�� *0 loadedexportlibrary loadedExportLibrary�  �    l     ����  �  �    l     �  �      **** export the notes ****     �!! 4 * * * *   e x p o r t   t h e   n o t e s   * * * * "#" l Sj$����$ r  Sj%&% b  Sf'(' b  Sb)*) b  S^+,+ b  SZ-.- m  SV// �00  e c h o   ". o  VY���� 	0 notes  , m  Z]11 �22  " >  * o  ^a���� 0 rootpath rootPath( m  be33 �44  / n o t e s . t x t& o      ���� 0 	thescript  ��  ��  # 565 l kr7����7 I kr��8��
�� .sysoexecTEXT���     TEXT8 o  kn���� 0 	thescript  ��  ��  ��  6 9:9 l     ��������  ��  ��  : ;<; l     ��=>��  = $ **** Create the html file ****   > �?? < * * * *   C r e a t e   t h e   h t m l   f i l e   * * * *< @A@ l s~B����B r  s~CDC b  szEFE m  svGG �HH B / U s e r s / i a i n / b i n / b u i l d - s h o o t - p a g e  F o  vy���� 0 rootpath rootPathD o      ���� 0 	thescript  ��  ��  A IJI l �K����K I ���L��
�� .ascrcmnt****      � ****L o  ����� 0 	thescript  ��  ��  ��  J M��M l ��N����N I ����O��
�� .sysoexecTEXT���     TEXTO o  ������ 0 	thescript  ��  ��  ��  ��       ��P IQ��  P ������ 	0 p_sql  
�� .aevtoappnull  �   � ****Q ��R����ST��
�� .aevtoappnull  �   � ****R k    �UU  VV   WW  1XX  @YY  SZZ  Z[[  a\\  f]]  m^^  }__  �``  �aa  �bb  �cc  �dd  �ee  �ff  �gg jhh uii �jj �kk �ll �mm �nn �oo �pp �qq ,rr Dss \tt tuu �vv �ww �xx �yy �zz {{ "|| 5}} @~~ I M����  ��  ��  S  T j�������������������� >�������������������� w�� ��������������� ��� �������g���������� ���������+�HLX���������������������������������������������������������>Vn���������������/13G
�� .misccurdldt    ��� null
�� 
year
�� 
TEXT�� 0 curyear  
�� 
mnth�� 0 curmonth  
�� 
alis
�� afdrscr�
�� 
rtyp
�� .earsffdralis        afdr�� 0 librarypath libraryPath
�� .sysoloadscpt        file�� *0 loadedexportlibrary loadedExportLibrary�� 0 
getlibpath 
getLibPath�� 0 	g_libpath 	g_libPath
�� 
ret �� 0 theout theOut�� 0 	libcopied 	libCopied
�� 
psxp�� 0 libposix libPOSIX�� 0 
libdbposix 
libDBPOSIX�� 0 publishedpath PublishedPath
�� 
day �� 
0 curday  
�� 
time�� 0 curtime  �� 0 folderexists  �� 0 monthexists  �� 0 changemonthmessage  �� 0 changeyearmessage  �� 0 choosenproject  �� 0 pr  
�� 
rkfl
�� 
rkpj
�� 
pnam�� 0 x  
�� 
prmp
�� .gtqpchltns    @   @ ns  
�� 
rslt
�� 
cobj
�� .ascrcmnt****      � ****�  �� 0 monthtointeger  �� 0 monthint  
�� 
leng�� 0 ymp  �� 0 fullsizepath fullsizePath�� 0 	largepath 	largePath�� 0 masterspath mastersPath�� 0 
thumbspath 
thumbsPath�� 0 
mediumpath 
mediumPath�� 0 rootpath rootPath
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
0 cursel  �� 0 
seturgency 
setUrgency�� 0 
fileexists 
fileExists�� �� 0 
exportpics 
exportPics�� 0 addlinks addLinks���*j  �,�&E�O*j  �,�&E�O*����l 	�%/E�O�j E�O�j+ E�O_ E` OfE` O�a ,E` O_ a %�&E` Oa E` O*j  a ,�&E` O*j  a ,�&E` O���l+  
eE` Y fE` Oa E`  Oa !E` "OfE` #O_  E` $Oa %h_ #_  Y*a &�/ L*a &�/ BeE` #O*a '-a (,EE` )O_  _ )6FO_ )a *a +l ,O_ -a .k/E` $O_ $j /UUY hO_ $_    DfE` #O*a &�/ 1*a &-a (,E` )O_ "_ )6FO_ )a *a 0l ,O_ -a .k/E�UY hO�_ "  O*a &-a (,a 1[[a (,\Za 2@C\[a (,\Za 3>A1E` )O_ )a *a 4l ,O_ -a .k/E�OfE` Y eE` [OY��UO��k+ 5�&E` 6O_ 6a 7,k  a 8_ 6%E` 6Y hO�a 9%_ 6%a :%_ $%E` ;O_ a <%_ ;%E` =O_ a >%_ ;%E` ?O_ a @%_ ;%E` AO_ a B%_ ;%E` CO_ a D%_ ;%E` EO_ a F%_ ;%E` GOa % �*a &�/ }*a &�/ s*a '_ $/ gb   _ a H,%a I%*a J,%a K%E` LO_ Lj ME` NO_ Lj /O*a O-a 1[[a P,\Zl:\[a Q,\Za R8B1a S&E` TO�_ $k+ UUUUUO�_ =a ,k+ V a W_ =%E` LO_ Lj MY hO�_ Ca ,k+ V a X_ C%E` LO_ Lj MY hO�_ Aa ,k+ V a Y_ A%E` LO_ Lj MY hO�_ Ea ,k+ V a Z_ E%E` LO_ Lj MY hO�_ ?a ,k+ V a [_ ?%E` LO_ Lj MY hO�_ Ga ,k+ V a \_ G%E` LO_ Lj MY hOa ]_ C%a ^%_ E%a _%_ A%a `%_ =%a a%_ G%a b%_ ?%E` LO_ Lj MO�_ T_ _ ?_ C_ E_ =a c+ dO�_ T_ A_ m+ eOa f_ N%a g%_ G%a h%E` LO_ Lj MOa i_ G%E` LO_ Lj /O_ Lj M ascr  ��ޭ