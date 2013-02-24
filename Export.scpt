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
 l     ��������  ��  ��        j     �� �� 	0 p_sql    m        �   " / u s r / b i n / s q l i t e 3        p       ������ 0 dbpath DBPath��        p       ������ 0 	g_libpath 	g_libPath��        l     ��������  ��  ��        l     ����  n        I    �������� 0 
getlibpath 
getLibPath��  ��     f     ��  ��        l   	  ����   r    	 ! " ! o    ��
�� 
ret  " o      ���� 0 theout theOut��  ��     # $ # l     ��������  ��  ��   $  % & % l  
  '���� ' r   
  ( ) ( m   
 ��
�� boovfals ) o      ���� 0 	libcopied 	libCopied��  ��   &  * + * l    ,���� , r     - . - n     / 0 / 1    ��
�� 
psxp 0 o    ���� 0 	g_libpath 	g_libPath . o      ���� 0 libposix libPOSIX��  ��   +  1 2 1 l    3���� 3 r     4 5 4 c     6 7 6 l    8���� 8 b     9 : 9 o    ���� 0 libposix libPOSIX : m     ; ; � < < , / D a t a b a s e / L i b r a r y . a p d b��  ��   7 m    ��
�� 
TEXT 5 o      ���� 0 
libdbposix 
libDBPOSIX��  ��   2  = > = l     ��������  ��  ��   >  ? @ ? l     ��������  ��  ��   @  A B A l    C���� C r     D E D m     F F � G G < / U s e r s / i a i n / P i c t u r e s / P u b l i s h e d E o      ���� 0 publishedpath PublishedPath��  ��   B  H I H l    # J���� J r     # K L K m     ! M M � N N  / t m p / P u b l i s h e d L o      ���� 0 	backupdir 	BackupDir��  ��   I  O P O l     ��������  ��  ��   P  Q R Q l  $ 1 S���� S r   $ 1 T U T c   $ - V W V n   $ + X Y X 1   ) +��
�� 
year Y l  $ ) Z���� Z I  $ )������
�� .misccurdldt    ��� null��  ��  ��  ��   W m   + ,��
�� 
TEXT U o      ���� 0 curyear  ��  ��   R  [ \ [ l  2 A ]���� ] r   2 A ^ _ ^ c   2 = ` a ` n   2 ; b c b m   7 ;��
�� 
mnth c l  2 7 d���� d I  2 7������
�� .misccurdldt    ��� null��  ��  ��  ��   a m   ; <��
�� 
TEXT _ o      ���� 0 curmonth  ��  ��   \  e f e l  B Q g���� g r   B Q h i h c   B M j k j n   B K l m l 1   G K��
�� 
day  m l  B G n���� n I  B G������
�� .misccurdldt    ��� null��  ��  ��  ��   k m   K L��
�� 
TEXT i o      ���� 
0 curday  ��  ��   f  o p o l  R a q���� q r   R a r s r c   R ] t u t n   R [ v w v 1   W [��
�� 
time w l  R W x���� x I  R W������
�� .misccurdldt    ��� null��  ��  ��  ��   u m   [ \��
�� 
TEXT s o      ���� 0 curtime  ��  ��   p  y z y l     ��������  ��  ��   z  { | { l  b } }���� } Z   b } ~ �� � ~ I   b m�� ����� 0 folderexists   �  � � � o   c f���� 0 curyear   �  ��� � o   f i���� 0 curmonth  ��  ��    r   p u � � � m   p q��
�� boovtrue � o      ���� 0 monthexists  ��   � r   x } � � � m   x y��
�� boovfals � o      ���� 0 monthexists  ��  ��   |  � � � l     ��������  ��  ��   �  � � � l  ~ � ����� � r   ~ � � � � m   ~ � � � � � � $ * *   C h a n g e   m o n t h   * * � o      ���� 0 changemonthmessage  ��  ��   �  � � � l  � � ����� � r   � � � � � m   � � � � � � � " * *   C h a n g e   y e a r   * * � o      ���� 0 changeyearmessage  ��  ��   �  � � � l  � � ����� � r   � � � � � m   � ���
�� boovfals � o      ���� 0 choosenproject  ��  ��   �  � � � l  � � ����� � r   � � � � � o   � ����� 0 changemonthmessage   � o      ���� 0 pr  ��  ��   �  � � � l     ��~�}�  �~  �}   �  � � � l     �| � ��|   �  ** Choose a project **    � � � � , * *   C h o o s e   a   p r o j e c t   * * �  � � � l  �[ ��{�z � O   �[ � � � k   �Z � �  � � � V   �� � � � k   �� � �  � � � l  � ��y � ��y   � / )if curmonth is not changeyearmessage then    � � � � R i f   c u r m o n t h   i s   n o t   c h a n g e y e a r m e s s a g e   t h e n �  � � � Z   � � ��x�w � o   � ��v�v 0 monthexists   � O   � � � � O   �  � � � k   � � � �  � � � r   � � � � � m   � ��u
�u boovtrue � o      �t�t 0 choosenproject   �  � � � r   � � � � � e   � � � � n   � � � � � 1   � ��s
�s 
pnam � 2   � ��r
�r 
rkpj � o      �q�q 0 x   �  � � � r   � � � � � o   � ��p�p 0 changemonthmessage   � n       � � �  ;   � � � o   � ��o�o 0 x   �  � � � I  � ��n � �
�n .gtqpchltns    @   @ ns   � o   � ��m�m 0 x   � �l ��k
�l 
prmp � m   � � � � � � �   C h o o s e   a   p r o j e c t�k   �  ��j � r   � � � � � n   � � � � � 4   � ��i �
�i 
cobj � m   � ��h�h  � 1   � ��g
�g 
rslt � o      �f�f 0 pr  �j   � 4   � ��e �
�e 
rkfl � o   � ��d�d 0 curmonth   � 4   � ��c �
�c 
rkfl � o   � ��b�b 0 curyear  �x  �w   �  � � � Z  W � ��a�` � =  � � � o  	�_�_ 0 pr   � o  	�^�^ 0 changemonthmessage   � k  S � �  � � � r   � � � m  �]
�] boovfals � o      �\�\ 0 choosenproject   �  ��[ � O  S � � � k  !R � �  � � � r  !. � � � n  !* � � � 1  &*�Z
�Z 
pnam � 2  !&�Y
�Y 
rkfl � o      �X�X 0 x   �  � � � r  /7 � � � o  /2�W�W 0 changeyearmessage   � n       � � �  ;  56 � o  25�V�V 0 x   �  � � � I 8E�U 
�U .gtqpchltns    @   @ ns    o  8;�T�T 0 x   �S�R
�S 
prmp m  >A �  c h o o s e   m o n t h�R   � �Q r  FR n  FN	 4  IN�P

�P 
cobj
 m  LM�O�O 	 1  FI�N
�N 
rslt o      �M�M 0 curmonth  �Q   � 4  �L
�L 
rkfl o  �K�K 0 curyear  �[  �a  �`   � �J Z  X��I = X_ o  X[�H�H 0 curmonth   o  [^�G�G 0 changeyearmessage   k  b�  r  b� 6b� n  bk 1  gk�F
�F 
pnam 2  bg�E
�E 
rkfl F  n� H  o{ E  oz 1  pt�D
�D 
pnam m  uy   �!!  - C  |�"#" 1  }��C
�C 
pnam# m  ��$$ �%%  2 o      �B�B 0 x   &'& I ���A()
�A .gtqpchltns    @   @ ns  ( o  ���@�@ 0 x  ) �?*�>
�? 
prmp* m  ��++ �,,  c h o o s e   y e a r�>  ' -.- r  ��/0/ n  ��121 4  ���=3
�= 
cobj3 m  ���<�< 2 1  ���;
�; 
rslt0 o      �:�: 0 curyear  . 4�94 r  ��565 m  ���8
�8 boovfals6 o      �7�7 0 monthexists  �9  �I   r  ��787 m  ���6
�6 boovtrue8 o      �5�5 0 monthexists  �J   � H   � �99 o   � ��4�4 0 choosenproject   � :;: O  �<=< k  �>> ?@? r  ��ABA c  ��CDC l ��E�3�2E 6��FGF 2  ���1
�1 
rkdpG G  ��HIH l ��J�0�/J ? ��KLK 1  ���.
�. 
rkmrL m  ���-�- �0  �/  I l ��M�,�+M = ��NON 1  ���*
�* 
rkvcO m  ���)
�) rkclrkRD�,  �+  �3  �2  D m  ���(
�( 
listB o      �'�' 
0 cursel  @ PQP r  �RSR c  �TUT l �V�&�%V 6 �WXW 2  ���$
�$ 
rkdpX E  �YZY n  �[\[ 1  ��#
�# 
pnam\ 2  ���"
�" 
rkkwZ m  ]] �^^  B o r d e r F X�&  �%  U m  �!
�! 
listS o      � �  0 watermarkedsel  Q _�_ I �`�
� .ascrcmnt****      � ****` o  �� 0 watermarkedsel  �  �  = 4  ���a
� 
rkpja o  ���� 0 pr  ; bcb r   ded J  ��  e o      �� 0 watermarkedlist  c fgf X  !Ph�ih r  7Kjkj b  7Glml o  7:�� 0 watermarkedlist  m n  :Fnon 1  BF�
� 
rkvlo n  :Bpqp 4  ;B�r
� 
rkotr m  >Ass �tt  F i l e N a m eq o  :;�� 0 	thisimage  k o      �� 0 watermarkedlist  � 0 	thisimage  i o  $'�� 0 watermarkedsel  g uvu I QX�w�
� .ascrcmnt****      � ****w o  QT�� 0 watermarkedlist  �  v x�x l YY���
�  �  �
  �   � m   � �yy�                                                                                  fstp  alis    P  
Subversion                 �1ubH+     OAperture.app                                                    
�p��        ����  	                Applications    �1�      �~�Z       O  %Subversion:Applications: Aperture.app     A p e r t u r e . a p p   
 S u b v e r s i o n  Applications/Aperture.app   / ��  �{  �z   � z{z l     �	���	  �  �  { |}| l     �~�  ~  **** Set up paths ****    ��� , * * * *   S e t   u p   p a t h s   * * * *} ��� l \j���� r  \j��� c  \f��� I  \d���� 0 monthtointeger  � ��� o  ]`� �  0 curmonth  �  �  � m  de��
�� 
TEXT� o      ���� 0 monthint  �  �  � ��� l k������� Z  k�������� = kt��� n  kr��� 1  nr��
�� 
leng� o  kn���� 0 monthint  � m  rs���� � r  w���� b  w~��� m  wz�� ���  0� o  z}���� 0 monthint  � o      ���� 0 monthint  ��  ��  ��  ��  � ��� l     ��������  ��  ��  � ��� l �������� r  ����� b  ����� b  ����� b  ����� b  ����� b  ����� b  ����� o  ������ 0 publishedpath PublishedPath� m  ���� ���  /� o  ������ 0 curyear  � m  ���� ���  /� o  ������ 0 monthint  � m  ���� ���  /� o  ������ 0 pr  � o      ���� 0 directorypath  ��  ��  � ��� l �������� r  ����� b  ����� b  ����� b  ����� b  ����� b  ����� o  ������ 0 	backupdir 	BackupDir� m  ���� ���  /� o  ������ 0 curyear  � o  ������ 0 curmonth  � o  ������ 
0 curday  � o  ������ 0 curtime  � o      ���� 0 prbackupdir PrBackupDir��  ��  � ��� l �������� r  ����� b  ����� o  ������ 0 directorypath  � m  ���� ���  / m a s t e r s� o      ���� 0 masterspath mastersPath��  ��  � ��� l �������� r  ����� b  ����� o  ������ 0 directorypath  � m  ���� ���  / t h u m b s� o      ���� 0 
thumbspath  ��  ��  � ��� l �������� r  ����� b  ����� o  ������ 0 directorypath  � m  ���� ���  / w a t e r m a r k e d� o      ���� 0 watermarkedpath  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  � ) #**** Backup any existing files ****   � ��� F * * * *   B a c k u p   a n y   e x i s t i n g   f i l e s   * * * *� ��� l     ������  �    check if backupdir exists   � ��� 4   c h e c k   i f   b a c k u p d i r   e x i s t s� ��� l ������� Z  �������� H  ���� I  ��������� 0 
fileexists 
fileExists� ���� n  ����� 1  ����
�� 
psxp� o  ������ 0 	backupdir 	BackupDir��  ��  � k  ��� ��� r  ����� b  ����� m  ���� ���  m k d i r   - p  � l �������� n  ����� 1  ����
�� 
psxp� o  ������ 0 	backupdir 	BackupDir��  ��  � o      ���� 0 	thescript  �  ��  I �����
�� .sysoexecTEXT���     TEXT o  ������ 0 	thescript  ��  ��  ��  ��  ��  ��  �  l     ��������  ��  ��    l 5���� Z  5���� I  ��	���� 0 
fileexists 
fileExists	 
��
 n   1  ��
�� 
psxp o  ���� 0 directorypath  ��  ��   k  1  r  ) b  % b   b   m   �  m v   o  ���� 0 directorypath   m   �    l $���� n  $ 1  "$��
�� 
psxp o  "���� 0 prbackupdir PrBackupDir��  ��   o      ���� 0 	thescript   �� I *1�� ��
�� .sysoexecTEXT���     TEXT  o  *-���� 0 	thescript  ��  ��  ��  ��  ��  ��   !"! l     ��������  ��  ��  " #$# l     ��%&��  % ' ! check if export directory exists   & �'' B   c h e c k   i f   e x p o r t   d i r e c t o r y   e x i s t s$ ()( l 6�*����* Z  6�+,��-+ H  6A.. I  6@��/���� 0 
fileexists 
fileExists/ 0��0 n  7<121 1  :<��
�� 
psxp2 o  7:���� 0 directorypath  ��  ��  , k  Dg33 454 r  D_676 b  D[898 b  DW:;: b  DS<=< b  DO>?> b  DK@A@ m  DGBB �CC  m k d i r   - p  A o  GJ���� 0 
thumbspath  ? m  KNDD �EE  ;   m k d i r   - p  = o  OR���� 0 watermarkedpath  ; m  SVFF �GG  / t m p   ;   m k d i r  9 o  WZ���� 0 masterspath mastersPath7 o      ���� 0 	thescript  5 HIH l ``��JK��  J M Gmaking thumbspath with the -p option causes directorypath to be created   K �LL � m a k i n g   t h u m b s p a t h   w i t h   t h e   - p   o p t i o n   c a u s e s   d i r e c t o r y p a t h   t o   b e   c r e a t e dI M��M I `g��N��
�� .sysoexecTEXT���     TEXTN o  `c���� 0 	thescript  ��  ��  ��  - k  j�OO PQP r  j}RSR b  jyTUT b  juVWV b  jqXYX m  jmZZ �[[  m v  Y o  mp���� 0 directorypath  W m  qt\\ �]]  / *  U o  ux���� 0 prbackupdir PrBackupDirS o      ���� 0 	thescript  Q ^��^ Q  ~�_`��_ I ����a��
�� .sysoexecTEXT���     TEXTa o  ������ 0 	thescript  ��  ` R      ������
�� .ascrerr ****      � ****��  ��  ��  ��  ��  ��  ) bcb l     ��������  ��  ��  c ded l     ��fg��  f  **** Export the pics ****   g �hh 2 * * * *   E x p o r t   t h e   p i c s   * * * *e iji l �ik����k O  �ilml k  �hnn opo t  �8qrq k  �7ss tut I ����vw
�� .rkstrkxpnull���     ****v o  ������ 
0 cursel  w ��xy
�� 
nmfix 4  ����z
�� 
rknpz m  ��{{ �||  M a s t e ry �}~
� 
faal} 4  ���~
�~ 
rkes m  ���� ��� ( J P E G   -   O r i g i n a l   S i z e~ �}��|
�} 
insh� o  ���{�{ 0 directorypath  �|  u ��� I ���z��
�z .rkstrkxpnull���     ****� o  ���y�y 
0 cursel  � �x��
�x 
nmfi� 4  ���w�
�w 
rknp� m  ���� ���  M a s t e r� �v��
�v 
faal� 4  ���u�
�u 
rkes� m  ���� ���   J P E G   -   T h u m b n a i l� �t��s
�t 
insh� o  ���r�r 0 
thumbspath  �s  � ��� I ��q��
�q .rkstrkxpnull���     ****� o  ���p�p 
0 cursel  � �o��
�o 
nmfi� 4  ���n�
�n 
rknp� m  ���� ���  M a s t e r� �m��
�m 
faal� 4  ��l�
�l 
rkes� m  � �� ��� R J P E G   -   F i t   w i t h i n   1 0 2 4   x   1 0 2 4   W a t e r m a r k e d� �k��j
�k 
insh� o  �i�i 0 watermarkedpath  �j  � ��h� I 7�g��
�g .rkstrkxpnull���     ****� o  �f�f 0 watermarkedsel  � �e��
�e 
nmfi� 4  �d�
�d 
rknp� m  �� ���  M a s t e r� �c��
�c 
faal� 4  '�b�
�b 
rkes� m  #&�� ��� ( J P E G   -   O r i g i n a l   S i z e� �a��`
�a 
insh� b  *1��� o  *-�_�_ 0 watermarkedpath  � m  -0�� ���  / t m p�`  �h  r m  ���^�^p ��� r  9X��� b  9T��� b  9P��� b  9L��� b  9H��� b  9D��� b  9@��� m  9<�� ���  m v   - f  � o  <?�]�] 0 watermarkedpath  � m  @C�� ���  / t m p / *  � o  DG�\�\ 0 watermarkedpath  � m  HK�� ���  ;   r m   - r  � o  LO�[�[ 0 watermarkedpath  � m  PS�� ���  / t m p� o      �Z�Z 0 	thescript  � ��� I Y`�Y��X
�Y .sysoexecTEXT���     TEXT� o  Y\�W�W 0 	thescript  �X  � ��V� I ah�U��T
�U .ascrcmnt****      � ****� o  ad�S�S 0 	thescript  �T  �V  m m  �����                                                                                  fstp  alis    P  
Subversion                 �1ubH+     OAperture.app                                                    
�p��        ����  	                Applications    �1�      �~�Z       O  %Subversion:Applications: Aperture.app     A p e r t u r e . a p p   
 S u b v e r s i o n  Applications/Aperture.app   / ��  ��  ��  j ��� l     �R�Q�P�R  �Q  �P  � ��� l     �O���O  � $ **** Add links to masters ****   � ��� < * * * *   A d d   l i n k s   t o   m a s t e r s   * * * *� ��� l j���N�M� O  j���� X  p���L�� k  ���� ��� r  ����� n  ����� 1  ���K
�K 
rkrd� o  ���J�J 
0 curimg  � o      �I�I 0 isref isRef� ��� r  ����� n  ����� 1  ���H
�H 
ID  � o  ���G�G 
0 curimg  � o      �F�F 0 curid curID� ��� l ���E�D�C�E  �D  �C  � ��� r  ����� n  ����� 1  ���B
�B 
pnam� o  ���A�A 
0 curimg  � o      �@�@ 0 curname  � ��� r  ����� n  ����� 1  ���?
�? 
rkvl� n  ����� 4  ���>�
�> 
rkot� m  ���� ���  F i l e N a m e� o  ���=�= 
0 curimg  � o      �<�< 0 
mastername 
masterName� � � l ���;�:�9�;  �:  �9     r  �� l ���8�7 b  �� l ���6�5 o  ���4�4 0 curname  �6  �5   m  ��		 �

            -          �8  �7   o      �3�3 0 newline newLine  l ���2�1�0�2  �1  �0    Z  ���/�. = �� o  ���-�- 0 isref isRef m  ���,
�, boovtrue k  ��  r  �� b  �� b  �� b  �� b  �� o  ���+�+ 	0 p_sql   l �� �*�)  n  ��!"! 1  ���(
�( 
strq" o  ���'�' 0 
libdbposix 
libDBPOSIX�*  �)   m  ��## �$$ ^   " s e l e c t   M A S T E R U U I D   f r o m   R K V E R S I O N   w h e r e   U U I D = ' o  ���&�& 0 curid curID m  ��%% �&&  ' " o      �%�% 0 	thescript   '(' r  ��)*) I ���$+�#
�$ .sysoexecTEXT���     TEXT+ o  ���"�" 0 	thescript  �#  * o      �!�! 0 	zfileuuid 	ZFILEUUID( ,-, l ��� ���   �  �  - ./. l ���01�  0 ' ! ---------- Get the master's path   1 �22 B   - - - - - - - - - -   G e t   t h e   m a s t e r ' s   p a t h/ 343 r  �565 b  �787 b  �9:9 b  � ;<; b  ��=>= o  ���� 	0 p_sql  > l ��?��? n  ��@A@ 1  ���
� 
strqA o  ���� 0 
libdbposix 
libDBPOSIX�  �  < m  ��BB �CC Z   " s e l e c t   I M A G E P A T H   f r o m   R K M A S T E R   w h e r e   U U I D = ': o   �� 0 	zfileuuid 	ZFILEUUID8 m  DD �EE  ' "6 o      �� 0 	thescript  4 FGF r  HIH I �J�
� .sysoexecTEXT���     TEXTJ o  �� 0 	thescript  �  I o      �� 0 
zimagepath 
ZIMAGEPATHG KLK l ����  �  �  L MNM l �OP�  O , & ---------- Get the master's disk name   P �QQ L   - - - - - - - - - -   G e t   t h e   m a s t e r ' s   d i s k   n a m eN RSR r  4TUT b  0VWV b  ,XYX b  (Z[Z b  $\]\ o  �� 	0 p_sql  ] l #^��^ n  #_`_ 1  #�

�
 
strq` o  �	�	 0 
libdbposix 
libDBPOSIX�  �  [ m  $'aa �bb d   " s e l e c t   F I L E V O L U M E U U I D   f r o m   R K M A S T E R   w h e r e   U U I D = 'Y o  (+�� 0 	zfileuuid 	ZFILEUUIDW m  ,/cc �dd  ' "U o      �� 0 	thescript  S efe r  5@ghg I 5<�i�
� .sysoexecTEXT���     TEXTi o  58�� 0 	thescript  �  h o      �� "0 zfilevolumeuuid ZFILEVOLUMEUUIDf jkj r  A\lml b  AXnon b  ATpqp b  APrsr b  ALtut o  AF�� 	0 p_sql  u l FKv�� v n  FKwxw 1  GK��
�� 
strqx o  FG���� 0 
libdbposix 
libDBPOSIX�  �   s m  LOyy �zz P   " s e l e c t   N A M E   f r o m   R K V O L U M E   w h e r e   U U I D = 'q o  PS���� "0 zfilevolumeuuid ZFILEVOLUMEUUIDo m  TW{{ �||  ' "m o      ���� 0 	thescript  k }~} r  ]h� I ]d�����
�� .sysoexecTEXT���     TEXT� o  ]`���� 0 	thescript  ��  � o      ���� 0 diskname diskName~ ��� l ii��������  ��  ��  � ��� r  it��� b  ip��� m  il�� ���  /� o  lo���� 0 
zimagepath 
ZIMAGEPATH� o      ���� 0 imgpath imgPath� ��� r  u���� b  u���� b  u���� b  u���� b  u���� b  u���� m  ux�� ���  l n   - s  � n  x��� 1  {��
�� 
strq� o  x{���� 0 imgpath imgPath� m  ���� ���   � o  ������ 0 masterspath mastersPath� m  ���� ���  /� n  ����� 1  ����
�� 
strq� o  ������ 0 
mastername 
masterName� o      ���� 0 	thescript  � ���� Q  ������� I �������
�� .sysoexecTEXT���     TEXT� o  ������ 0 	thescript  ��  � R      ������
�� .ascrerr ****      � ****��  ��  ��  ��  �/  �.   ��� l ����������  ��  ��  � ��� r  ����� b  ����� o  ������ 0 newline newLine� o  ������ 0 	thescript  � o      ���� 0 newline newLine� ��� r  ����� b  ����� b  ����� o  ������ 0 theout theOut� o  ������ 0 newline newLine� o  ����
�� 
ret � o      ���� 0 theout theOut� ���� l ����������  ��  ��  ��  �L 
0 curimg  � o  sv���� 
0 cursel  � m  jm���                                                                                  fstp  alis    P  
Subversion                 �1ubH+     OAperture.app                                                    
�p��        ����  	                Applications    �1�      �~�Z       O  %Subversion:Applications: Aperture.app     A p e r t u r e . a p p   
 S u b v e r s i o n  Applications/Aperture.app   / ��  �N  �M  � ��� l �������� L  ���� o  ������ 0 theout theOut��  ��  � ��� l     ��������  ��  ��  � ��� i    ��� I      ������� 0 
fileexists 
fileExists� ���� o      ���� 0 	posixpath 	posixPath��  ��  � L     �� c     ��� l    ������ c     ��� l    ������ I    �����
�� .sysoexecTEXT���     TEXT� b     ��� b     ��� m     �� ���  i f   t e s t   - e  � n    ��� 1    ��
�� 
strq� o    ���� 0 	posixpath 	posixPath� m    �� ��� < ;   t h e n 
 e c h o   1 ; 
 e l s e 
 e c h o   0 ; 
 f i��  ��  ��  � m    ��
�� 
long��  ��  � m    ��
�� 
bool� ��� l     ��������  ��  ��  � ��� i    
��� I      ������� 0 folderexists  � ��� o      ���� 0 
folderyear  � ���� o      ���� 0 foldermonth  ��  ��  � O     1��� k    0�� ��� Z    -������� I   �����
�� .coredoexnull���     ****� 4    ���
�� 
rkfl� o    ���� 0 
folderyear  ��  � O    )��� Z    (������ I   �����
�� .coredoexnull���     ****� 4    ���
�� 
rkfl� o    ���� 0 foldermonth  ��  � L   ! #�� m   ! "��
�� boovtrue��  � L   & (�� m   & '��
�� boovfals� 4    ���
�� 
rkfl� o    ���� 0 
folderyear  ��  ��  � ���� L   . 0�� m   . /��
�� boovfals��  � m     ���                                                                                  fstp  alis    P  
Subversion                 �1ubH+     OAperture.app                                                    
�p��        ����  	                Applications    �1�      �~�Z       O  %Subversion:Applications: Aperture.app     A p e r t u r e . a p p   
 S u b v e r s i o n  Applications/Aperture.app   / ��  � ��� l     ��������  ��  ��  � ��� i    ��� I      �������� 0 
getlibpath 
getLibPath��  ��  � k     b�� � � O     r     n     1    ��
�� 
valL n     4    ��	
�� 
plii	 m    

 �  L i b r a r y P a t h 4    ��
�� 
plif l   ���� b     l   ���� I   ��
�� .earsffdralis        afdr m    ��
�� afdrpref ����
�� 
rtyp m    	��
�� 
utxt��  ��  ��   m     � 0 c o m . a p p l e . A p e r t u r e . p l i s t��  ��   o      ���� 0 	p_libpath 	p_libPath m     �                                                                                  sevs  alis    �  
Subversion                 �1ubH+     2System Events.app                                               0��a9        ����  	                CoreServices    �1�      ���       2   ,   +  ;Subversion:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p   
 S u b v e r s i o n  -System/Library/CoreServices/System Events.app   / ��     l   ��������  ��  ��   �� Z    b�� l   $���� >   $ l   " ����  I   "����!
�� .sysooffslong    ��� null��  ! ��"#
�� 
psof" m    $$ �%%  ~# ��&��
�� 
psin& o    ���� 0 	p_libpath 	p_libPath��  ��  ��   m   " #����  ��  ��   k   ' Z'' ()( r   ' **+* m   ' (,, �--  / b i n / e c h o   $ H O M E+ o      ���� 0 p_script  ) ./. r   + 2010 l  + 02����2 I  + 0��3��
�� .sysoexecTEXT���     TEXT3 o   + ,���� 0 p_script  ��  ��  ��  1 o      �� 0 
p_homepath 
p_homePath/ 454 l  3 3�~�}�|�~  �}  �|  5 676 r   3 @898 I  3 >�{�z:
�{ .sysooffslong    ��� null�z  : �y;<
�y 
psof; m   5 8== �>>  ~< �x?�w
�x 
psin? o   9 :�v�v 0 	p_libpath 	p_libPath�w  9 o      �u�u 0 p_offset  7 @A@ r   A RBCB n   A PDED 7  B P�tFG
�t 
ctxtF l  H LH�s�rH [   H LIJI o   I J�q�q 0 p_offset  J m   J K�p�p �s  �r  G m   M O�o�o��E o   A B�n�n 0 	p_libpath 	p_libPathC o      �m�m 
0 p_path  A KLK l  S S�l�k�j�l  �k  �j  L M�iM r   S ZNON b   S VPQP o   S T�h�h 0 
p_homepath 
p_homePathQ o   T U�g�g 
0 p_path  O o      �f�f 0 	g_libpath 	g_libPath�i  ��   r   ] bRSR o   ] ^�e�e 0 	p_libpath 	p_libPathS o      �d�d 0 	g_libpath 	g_libPath��  � TUT l     �c�b�a�c  �b  �a  U VWV i    XYX I      �`Z�_�` 0 monthtointeger  Z [�^[ o      �]�] 0 monthstring  �^  �_  Y L     \\ c     ]^] n     
_`_ m    
�\
�\ 
mnth` 4     �[a
�[ 
ldt a l   b�Z�Yb b    cdc b    efe m    gg �hh  1 /f o    �X�X 0 monthstring  d m    ii �jj 
 / 2 0 1 2�Z  �Y  ^ m   
 �W
�W 
longW klk l     �V�U�T�V  �U  �T  l mnm i    opo I      �Sq�R�S 0 monthtostring  q r�Qr o      �P�P 0 monthint  �Q  �R  p L     ss c     tut n     
vwv m    
�O
�O 
mnthw 4     �Nx
�N 
ldt x l   y�M�Ly b    z{z b    |}| m    ~~ �  1 /} o    �K�K 0 monthint  { m    �� ��� 
 / 2 0 1 2�M  �L  u m   
 �J
�J 
TEXTn ��I� l     �H�G�F�H  �G  �F  �I       :�E� ���������D�� F M�����C � ��B�������������A����������@�?�>�=�<�;�:�9�8�7�6�5�E  � 8�4�3�2�1�0�/�.�-�,�+�*�)�(�'�&�%�$�#�"�!� ����������������������
�	��������� �������4 	0 p_sql  �3 0 
fileexists 
fileExists�2 0 folderexists  �1 0 
getlibpath 
getLibPath�0 0 monthtointeger  �/ 0 monthtostring  
�. .aevtoappnull  �   � ****�- 0 	g_libpath 	g_libPath�, 0 theout theOut�+ 0 	libcopied 	libCopied�* 0 libposix libPOSIX�) 0 
libdbposix 
libDBPOSIX�( 0 publishedpath PublishedPath�' 0 	backupdir 	BackupDir�& 0 curyear  �% 0 curmonth  �$ 
0 curday  �# 0 curtime  �" 0 monthexists  �! 0 changemonthmessage  �  0 changeyearmessage  � 0 choosenproject  � 0 pr  � 0 x  � 
0 cursel  � 0 watermarkedsel  � 0 watermarkedlist  � 0 monthint  � 0 directorypath  � 0 prbackupdir PrBackupDir� 0 masterspath mastersPath� 0 
thumbspath  � 0 watermarkedpath  � 0 	thescript  � 0 isref isRef� 0 curid curID� 0 curname  � 0 
mastername 
masterName� 0 newline newLine� 0 	zfileuuid 	ZFILEUUID� 0 
zimagepath 
ZIMAGEPATH� "0 zfilevolumeuuid ZFILEVOLUMEUUID�
 0 diskname diskName�	 0 imgpath imgPath�  �  �  �  �  �  �  �  �   ��  ��  ��  � ������������� 0 
fileexists 
fileExists�� ����� �  ���� 0 	posixpath 	posixPath��  � ���� 0 	posixpath 	posixPath� ����������
�� 
strq
�� .sysoexecTEXT���     TEXT
�� 
long
�� 
bool�� ��,%�%j �&�&� ������������� 0 folderexists  �� ����� �  ������ 0 
folderyear  �� 0 foldermonth  ��  � ������ 0 
folderyear  �� 0 foldermonth  � �����
�� 
rkfl
�� .coredoexnull���     ****�� 2� .*�/j  *�/ *�/j  eY fUY hOfU� ������������� 0 
getlibpath 
getLibPath��  ��  � ������������ 0 	p_libpath 	p_libPath�� 0 p_script  �� 0 
p_homepath 
p_homePath�� 0 p_offset  �� 
0 p_path  � ������������
����$������,��=����
�� 
plif
�� afdrpref
�� 
rtyp
�� 
utxt
�� .earsffdralis        afdr
�� 
plii
�� 
valL
�� 
psof
�� 
psin�� 
�� .sysooffslong    ��� null
�� .sysoexecTEXT���     TEXT
�� 
ctxt�� 0 	g_libpath 	g_libPath�� c� *����l �%/��/�,E�UO*���� j 8�E�O�j E�O*�a �� E�O�[a \[Z�k\Zi2E�O��%E` Y �E` � ��Y���������� 0 monthtointeger  �� ����� �  ���� 0 monthstring  ��  � ���� 0 monthstring  � ��gi����
�� 
ldt 
�� 
mnth
�� 
long�� *��%�%/�,�&� ��p���������� 0 monthtostring  �� ����� �  ���� 0 monthint  ��  � ���� 0 monthint  � ��~�����
�� 
ldt 
�� 
mnth
�� 
TEXT�� *��%�%/�,�&� �����������
�� .aevtoappnull  �   � ****� k    ���  ��  ��  %��  *��  1��  A��  H��  Q��  [��  e��  o��  {��  ���  ���  ���  ���  ��� ��� ��� ��� ��� ��� ��� ��� ��� �� (�� i�� ��� �����  ��  ��  � ������ 0 	thisimage  �� 
0 curimg  � ��������������� ;���� F�� M������������������������ ��� �������y���������� �������� $+��������������]������������s���������������������~��}�|��{�zBDFZ\�y�x�w�v�u{�t�s��r�q�p������������o�n�m�l�k��j	�i�h#%�gBD�fac�ey{�d��c����� 0 
getlibpath 
getLibPath
�� 
ret �� 0 theout theOut�� 0 	libcopied 	libCopied�� 0 	g_libpath 	g_libPath
�� 
psxp�� 0 libposix libPOSIX
�� 
TEXT�� 0 
libdbposix 
libDBPOSIX�� 0 publishedpath PublishedPath�� 0 	backupdir 	BackupDir
�� .misccurdldt    ��� null
�� 
year�� 0 curyear  
�� 
mnth�� 0 curmonth  
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
cobj�  
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
rkkw�� 0 watermarkedsel  
�� .ascrcmnt****      � ****�� 0 watermarkedlist  
�� 
kocl
�� .corecnte****       ****
�� 
rkot
�� 
rkvl�� 0 monthtointeger  �� 0 monthint  
�� 
leng�� 0 directorypath  �� 0 prbackupdir PrBackupDir� 0 masterspath mastersPath�~ 0 
thumbspath  �} 0 watermarkedpath  �| 0 
fileexists 
fileExists�{ 0 	thescript  
�z .sysoexecTEXT���     TEXT�y  �x  �w
�v 
nmfi
�u 
rknp
�t 
faal
�s 
rkes
�r 
insh�q 
�p .rkstrkxpnull���     ****
�o 
rkrd�n 0 isref isRef
�m 
ID  �l 0 curid curID�k 0 curname  �j 0 
mastername 
masterName�i 0 newline newLine
�h 
strq�g 0 	zfileuuid 	ZFILEUUID�f 0 
zimagepath 
ZIMAGEPATH�e "0 zfilevolumeuuid ZFILEVOLUMEUUID�d 0 diskname diskName�c 0 imgpath imgPath���)j+  O�E�OfE�O��,E�O��%�&E�O�E�O�E�O*j �,�&E` O*j a ,�&E` O*j a ,�&E` O*j a ,�&E` O*_ _ l+  
eE` Y fE` Oa E` Oa E` OfE` O_ E` Oa �h_ _  U*a  _ / F*a  _ / :eE` O*a !-a ",EE` #O_ _ #6FO_ #a $a %l &O_ 'a (k/E` UUY hO_ _   HfE` O*a  _ / 3*a  -a ",E` #O_ _ #6FO_ #a $a )l &O_ 'a (k/E` UY hO_ _   Q*a  -a ",a *[[a ",\Za +@C\[a ",\Za ,>A1E` #O_ #a $a -l &O_ 'a (k/E` OfE` Y eE` [OY��O*a !_ / S*a .-a *[[a /,\Zm:\[a 0,\Za 18B1a 2&E` 3O*a .-a *[a 4-a ",\Za 5@1a 2&E` 6O_ 6j 7UOjvE` 8O ._ 6[a 9a (l :kh  _ 8�a ;a </a =,%E` 8[OY��O_ 8j 7OPUO*_ k+ >�&E` ?O_ ?a @,k  a A_ ?%E` ?Y hO�a B%_ %a C%_ ?%a D%_ %E` EO�a F%_ %_ %_ %_ %E` GO_ Ea H%E` IO_ Ea J%E` KO_ Ea L%E` MO*��,k+ N a O��,%E` PO_ Pj QY hO*_ E�,k+ N "a R_ E%a S%_ G�,%E` PO_ Pj QY hO*_ E�,k+ N (a T_ K%a U%_ M%a V%_ I%E` PO_ Pj QY )a W_ E%a X%_ G%E` PO _ Pj QW X Y ZhOa  �a [n_ 3a \*a ]a ^/a _*a `a a/a b_ Ea c dO_ 3a \*a ]a e/a _*a `a f/a b_ Ka c dO_ 3a \*a ]a g/a _*a `a h/a b_ Ma c dO_ 6a \*a ]a i/a _*a `a j/a b_ Ma k%a c doOa l_ M%a m%_ M%a n%_ M%a o%E` PO_ Pj QO_ Pj 7UOa _\_ 3[a 9a (l :kh �a p,E` qO�a r,E` sO�a ",E` tO�a ;a u/a =,E` vO_ ta w%E` xO_ qe  �b   �a y,%a z%_ s%a {%E` PO_ Pj QE` |Ob   �a y,%a }%_ |%a ~%E` PO_ Pj QE` Ob   �a y,%a �%_ |%a �%E` PO_ Pj QE` �Ob   �a y,%a �%_ �%a �%E` PO_ Pj QE` �Oa �_ %E` �Oa �_ �a y,%a �%_ I%a �%_ va y,%E` PO _ Pj QW X Y ZhY hO_ x_ P%E` xO�_ x%�%E�OP[OY��UO�� ��� ^ / U s e r s / i a i n / P i c t u r e s / A p e r t u r e   L i b r a r y . a p l i b r a r y� ���
  D I W _ 0 0 2 8           -           l n   - s   ' / U s e r s / i a i n / P i c t u r e s / P h o t o s / 2 0 1 3 / 0 2 / 1 7 - B i k e - T r i p / D I W _ 0 0 2 8 . N E F '   / U s e r s / i a i n / P i c t u r e s / P u b l i s h e d / 2 0 1 3 / 0 2 / 1 7 - B i k e - T r i p / m a s t e r s / ' D I W _ 0 0 2 8 . N E F '  D I W _ 0 0 4 6           -           l n   - s   ' / U s e r s / i a i n / P i c t u r e s / P h o t o s / 2 0 1 3 / 0 2 / 1 7 - B i k e - T r i p / D I W _ 0 0 4 6 . N E F '   / U s e r s / i a i n / P i c t u r e s / P u b l i s h e d / 2 0 1 3 / 0 2 / 1 7 - B i k e - T r i p / m a s t e r s / ' D I W _ 0 0 4 6 . N E F '  D I W _ 0 0 3 5           -           l n   - s   ' / U s e r s / i a i n / P i c t u r e s / P h o t o s / 2 0 1 3 / 0 2 / 1 7 - B i k e - T r i p / D I W _ 0 0 3 5 . N E F '   / U s e r s / i a i n / P i c t u r e s / P u b l i s h e d / 2 0 1 3 / 0 2 / 1 7 - B i k e - T r i p / m a s t e r s / ' D I W _ 0 0 3 5 . N E F '  D I W _ 0 0 4 1           -           l n   - s   ' / U s e r s / i a i n / P i c t u r e s / P h o t o s / 2 0 1 3 / 0 2 / 1 7 - B i k e - T r i p / D I W _ 0 0 4 1 . N E F '   / U s e r s / i a i n / P i c t u r e s / P u b l i s h e d / 2 0 1 3 / 0 2 / 1 7 - B i k e - T r i p / m a s t e r s / ' D I W _ 0 0 4 1 . N E F '  D I W _ 0 0 3 0           -           l n   - s   ' / U s e r s / i a i n / P i c t u r e s / P h o t o s / 2 0 1 3 / 0 2 / 1 7 - B i k e - T r i p / D I W _ 0 0 3 0 . N E F '   / U s e r s / i a i n / P i c t u r e s / P u b l i s h e d / 2 0 1 3 / 0 2 / 1 7 - B i k e - T r i p / m a s t e r s / ' D I W _ 0 0 3 0 . N E F '  D I W _ 0 0 3 6           -           l n   - s   ' / U s e r s / i a i n / P i c t u r e s / P h o t o s / 2 0 1 3 / 0 2 / 1 7 - B i k e - T r i p / D I W _ 0 0 3 6 . N E F '   / U s e r s / i a i n / P i c t u r e s / P u b l i s h e d / 2 0 1 3 / 0 2 / 1 7 - B i k e - T r i p / m a s t e r s / ' D I W _ 0 0 3 6 . N E F '  D I W _ 0 0 4 2           -           l n   - s   ' / U s e r s / i a i n / P i c t u r e s / P h o t o s / 2 0 1 3 / 0 2 / 1 7 - B i k e - T r i p / D I W _ 0 0 4 2 . N E F '   / U s e r s / i a i n / P i c t u r e s / P u b l i s h e d / 2 0 1 3 / 0 2 / 1 7 - B i k e - T r i p / m a s t e r s / ' D I W _ 0 0 4 2 . N E F '  D I W _ 0 0 3 0   -   V e r s i o n   2           -           l n   - s   ' / U s e r s / i a i n / P i c t u r e s / P h o t o s / 2 0 1 3 / 0 2 / 1 7 - B i k e - T r i p / D I W _ 0 0 3 0 . N E F '   / U s e r s / i a i n / P i c t u r e s / P u b l i s h e d / 2 0 1 3 / 0 2 / 1 7 - B i k e - T r i p / m a s t e r s / ' D I W _ 0 0 3 0 . N E F '  D I W _ 0 0 3 7           -           l n   - s   ' / U s e r s / i a i n / P i c t u r e s / P h o t o s / 2 0 1 3 / 0 2 / 1 7 - B i k e - T r i p / D I W _ 0 0 3 7 . N E F '   / U s e r s / i a i n / P i c t u r e s / P u b l i s h e d / 2 0 1 3 / 0 2 / 1 7 - B i k e - T r i p / m a s t e r s / ' D I W _ 0 0 3 7 . N E F '  D I W _ 0 0 2 6           -           l n   - s   ' / U s e r s / i a i n / P i c t u r e s / P h o t o s / 2 0 1 3 / 0 2 / 1 7 - B i k e - T r i p / D I W _ 0 0 2 6 . N E F '   / U s e r s / i a i n / P i c t u r e s / P u b l i s h e d / 2 0 1 3 / 0 2 / 1 7 - B i k e - T r i p / m a s t e r s / ' D I W _ 0 0 2 6 . N E F '  D I W _ 0 0 3 2           -           l n   - s   ' / U s e r s / i a i n / P i c t u r e s / P h o t o s / 2 0 1 3 / 0 2 / 1 7 - B i k e - T r i p / D I W _ 0 0 3 2 . N E F '   / U s e r s / i a i n / P i c t u r e s / P u b l i s h e d / 2 0 1 3 / 0 2 / 1 7 - B i k e - T r i p / m a s t e r s / ' D I W _ 0 0 3 2 . N E F '  D I W _ 0 0 3 8           -           l n   - s   ' / U s e r s / i a i n / P i c t u r e s / P h o t o s / 2 0 1 3 / 0 2 / 1 7 - B i k e - T r i p / D I W _ 0 0 3 8 . N E F '   / U s e r s / i a i n / P i c t u r e s / P u b l i s h e d / 2 0 1 3 / 0 2 / 1 7 - B i k e - T r i p / m a s t e r s / ' D I W _ 0 0 3 8 . N E F '  D I W _ 0 0 4 4           -           l n   - s   ' / U s e r s / i a i n / P i c t u r e s / P h o t o s / 2 0 1 3 / 0 2 / 1 7 - B i k e - T r i p / D I W _ 0 0 4 4 . N E F '   / U s e r s / i a i n / P i c t u r e s / P u b l i s h e d / 2 0 1 3 / 0 2 / 1 7 - B i k e - T r i p / m a s t e r s / ' D I W _ 0 0 4 4 . N E F '  D I W _ 0 0 3 3           -           l n   - s   ' / U s e r s / i a i n / P i c t u r e s / P h o t o s / 2 0 1 3 / 0 2 / 1 7 - B i k e - T r i p / D I W _ 0 0 3 3 . N E F '   / U s e r s / i a i n / P i c t u r e s / P u b l i s h e d / 2 0 1 3 / 0 2 / 1 7 - B i k e - T r i p / m a s t e r s / ' D I W _ 0 0 3 3 . N E F ' 
�D boovfals� ��� ^ / U s e r s / i a i n / P i c t u r e s / A p e r t u r e   L i b r a r y . a p l i b r a r y� ��� � / U s e r s / i a i n / P i c t u r e s / A p e r t u r e   L i b r a r y . a p l i b r a r y / D a t a b a s e / L i b r a r y . a p d b� ���  2 0 1 3� ���  F e b r u a r y� ���  2 5� ���  3 3 1 1
�C boovtrue
�B boovtrue� ���  1 7 - B i k e - T r i p� �b��b �  ������� ��a�`�_�^�]�\�[�Z�Y�X�W�V�U�T�S� ��� . 0 6 - R u s s i a n s - a n d - a - d e v i l� ���  1 0 - T e t� ���  1 2 - L a z y - D e b b i e s� ��� " 1 3 - J e l l y f i s h - C r a b� ���  1 4 - B a d - V i s� ���  1 7 - B i k e - T r i p� ���  1 7 - S m a l l - D i v e r s�a  �`  �_  �^  �]  �\  �[  �Z  �Y  �X  �W  �V  �U  �T  �S  � �R��R �  ��������������� �� ��Q �P� y�O�N
�O 
rkpj � , b U b g j x D S T G G R F 2 J V f j K Q P Q
�N kfrmID  
�Q 
rkdp  � , Y Y k O z d F Z R o i w s L + B P n 7 p p g
�P kfrmID  �  �M�L y�K�J
�K 
rkpj � , b U b g j x D S T G G R F 2 J V f j K Q P Q
�J kfrmID  
�M 
rkdp �		 , G V U j f W J U R f m z A C + x a 3 l S X Q
�L kfrmID  � 

 �I�H y�G�F
�G 
rkpj � , b U b g j x D S T G G R F 2 J V f j K Q P Q
�F kfrmID  
�I 
rkdp � , J h q V Q u y 0 Q T i P S i z 1 A h K 4 N w
�H kfrmID  �  �E�D y�C�B
�C 
rkpj � , b U b g j x D S T G G R F 2 J V f j K Q P Q
�B kfrmID  
�E 
rkdp � , 9 a E 4 0 4 O j Q 1 q F 2 o H h S J l Y 6 Q
�D kfrmID  �  �A�@ y�?�>
�? 
rkpj � , b U b g j x D S T G G R F 2 J V f j K Q P Q
�> kfrmID  
�A 
rkdp � , W A Z 8 e G H B S w W e Q 4 9 H i o p r x A
�@ kfrmID  �  �=�< y�;�:
�; 
rkpj �   , b U b g j x D S T G G R F 2 J V f j K Q P Q
�: kfrmID  
�= 
rkdp �!! , V 3 m q f B D I T y i W I c 6 3 w S Y t C g
�< kfrmID  � "" #�9$�8# y�7%�6
�7 
rkpj% �&& , b U b g j x D S T G G R F 2 J V f j K Q P Q
�6 kfrmID  
�9 
rkdp$ �'' , 8 6 j % O S t 8 S G S N s e N Q y c w 5 V A
�8 kfrmID  � (( )�5*�4) y�3+�2
�3 
rkpj+ �,, , b U b g j x D S T G G R F 2 J V f j K Q P Q
�2 kfrmID  
�5 
rkdp* �-- , 7 T d h B z L h R R + O 1 2 A g f p E c e w
�4 kfrmID  � .. /�10�0/ y�/1�.
�/ 
rkpj1 �22 , b U b g j x D S T G G R F 2 J V f j K Q P Q
�. kfrmID  
�1 
rkdp0 �33 , A 3 Z F o d u x Q i + 6 o B 7 f f 1 T X 4 w
�0 kfrmID  � 44 5�-6�,5 y�+7�*
�+ 
rkpj7 �88 , b U b g j x D S T G G R F 2 J V f j K Q P Q
�* kfrmID  
�- 
rkdp6 �99 , p D i G W k w 7 Q A u S m f o G S c 4 p T A
�, kfrmID  � :: ;�)<�(; y�'=�&
�' 
rkpj= �>> , b U b g j x D S T G G R F 2 J V f j K Q P Q
�& kfrmID  
�) 
rkdp< �?? , 9 t r m 8 8 8 m R Y S 3 e Q q L R F 3 P % g
�( kfrmID  � @@ A�%B�$A y�#C�"
�# 
rkpjC �DD , b U b g j x D S T G G R F 2 J V f j K Q P Q
�" kfrmID  
�% 
rkdpB �EE , l j Q l j A 4 B S G S + 0 P X h P d 2 t I g
�$ kfrmID  � FF G�!H� G y�I�
� 
rkpjI �JJ , b U b g j x D S T G G R F 2 J V f j K Q P Q
� kfrmID  
�! 
rkdpH �KK , 4 H 0 9 X + o Z Q X G M C 9 3 2 p q n u 7 w
�  kfrmID  � LL M�N�M y�O�
� 
rkpjO �PP , b U b g j x D S T G G R F 2 J V f j K Q P Q
� kfrmID  
� 
rkdpN �QQ , P N 9 k L f x s Q Q 6 s i P u M W n Z p f g
� kfrmID  � �R� R  SS TT U�V�U y�W�
� 
rkpjW �XX , b U b g j x D S T G G R F 2 J V f j K Q P Q
� kfrmID  
� 
rkdpV �YY , 4 2 i % 5 % L 9 S q K K s 4 b a K d 1 F m g
� kfrmID  � �Z� Z  [[ �\\  D I W _ 0 0 4 4 . j p g� �]]  0 2� �^^ f / U s e r s / i a i n / P i c t u r e s / P u b l i s h e d / 2 0 1 3 / 0 2 / 1 7 - B i k e - T r i p� �__ B / t m p / P u b l i s h e d / 2 0 1 3 F e b r u a r y 2 5 3 3 1 1� �`` v / U s e r s / i a i n / P i c t u r e s / P u b l i s h e d / 2 0 1 3 / 0 2 / 1 7 - B i k e - T r i p / m a s t e r s� �aa t / U s e r s / i a i n / P i c t u r e s / P u b l i s h e d / 2 0 1 3 / 0 2 / 1 7 - B i k e - T r i p / t h u m b s� �bb ~ / U s e r s / i a i n / P i c t u r e s / P u b l i s h e d / 2 0 1 3 / 0 2 / 1 7 - B i k e - T r i p / w a t e r m a r k e d� �cc  l n   - s   ' / U s e r s / i a i n / P i c t u r e s / P h o t o s / 2 0 1 3 / 0 2 / 1 7 - B i k e - T r i p / D I W _ 0 0 3 3 . N E F '   / U s e r s / i a i n / P i c t u r e s / P u b l i s h e d / 2 0 1 3 / 0 2 / 1 7 - B i k e - T r i p / m a s t e r s / ' D I W _ 0 0 3 3 . N E F '
�A boovtrue� �dd , P N 9 k L f x s Q Q 6 s i P u M W n Z p f g� �ee  D I W _ 0 0 3 3� �ff  D I W _ 0 0 3 3 . N E F� �ggF D I W _ 0 0 3 3           -           l n   - s   ' / U s e r s / i a i n / P i c t u r e s / P h o t o s / 2 0 1 3 / 0 2 / 1 7 - B i k e - T r i p / D I W _ 0 0 3 3 . N E F '   / U s e r s / i a i n / P i c t u r e s / P u b l i s h e d / 2 0 1 3 / 0 2 / 1 7 - B i k e - T r i p / m a s t e r s / ' D I W _ 0 0 3 3 . N E F '� �hh , 7 O T Y 8 u h l T 8 u V 6 Q s O m B V b n Q� �ii x U s e r s / i a i n / P i c t u r e s / P h o t o s / 2 0 1 3 / 0 2 / 1 7 - B i k e - T r i p / D I W _ 0 0 3 3 . N E F� �jj , C % T 9 e Y 7 E T 6 C 0 v h B B 7 J z 4 % g� �kk  S u b v e r s i o n� �ll z / U s e r s / i a i n / P i c t u r e s / P h o t o s / 2 0 1 3 / 0 2 / 1 7 - B i k e - T r i p / D I W _ 0 0 3 3 . N E F�@  �?  �>  �=  �<  �;  �:  �9  �8  �7  �6  �5   ascr  ��ޭ