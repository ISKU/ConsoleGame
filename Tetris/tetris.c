#include <stdio.h>
#include <stdlib.h>
#include <windows.h>
#include <conio.h>
#include <time.h>
#define KEY_LEFT 75
#define KEY_RIGHT 77
#define KEY_DOWN 80
#define KEY_ROTATE 72
#define KEY_SPACE 32
#define MAP_X 10
#define MAP_Y 20
void init();
void select_shpae();
void KEY_PRESS();
void LEFT();
void RIGHT();
void DOWN();
void gotoxy();
void LINE_CHECK();
void Viewer();
int display();
int LEFT_CHECK();
int RIGHT_CHECK();
int DOWN_CHECK();
int ROTATE();
int check();
int MAX_Y();
int MAX_X();
int MIN_Y();
int MIN_X();
int Board[MAP_X][MAP_Y];
int X, Y;
int JUMSU;
int NEXT_SHAPE;
int rocount;
int delay;
int speed;
int stack_X[4];
int stack_Y[4];
int SHAPE_NUM;
int SHAPE_ARY[][4][4][4] = {{{{1,1,0,0},{1,1,0,0},{0,0,0,0},{0,0,0,0}
},{{1,1,0,0},{1,1,0,0},{0,0,0,0},{0,0,0,0}},{{1,1,0,0},{1,1,0,0},{0,0,0,0},{0,0,0,0}},{{1,1,0,0},{1,1,0,0},{0,0,0,0},{0,0,0,0}}
},{{{1,0,0,0},{1,0,0,0},{1,1,0,0},{0,0,0,0}},{{1,1,1,0},{1,0,0,0},{0,0,0,0},{0,0,0,0}},{{1,1,0,0},{0,1,0,0},{0,1,0,0},{0,0,0,0}},
{{0,0,1,0},{1,1,1,0},{0,0,0,0},{0,0,0,0}}},{{{0,1,0,0},{0,1,0,0},{1,1,0,0},{0,0,0,0}},{{1,0,0,0},{1,1,1,0},{0,0,0,0},{0,0,0,0}},{
{1,1,0,0},{1,0,0,0},{1,0,0,0},{0,0,0,0}},{{1,1,1,0},{0,0,1,0},{0,0,0,0},{0,0,0,0}}},{{{1,1,1,1},{0,0,0,0},{0,0,0,0},{0,0,0,0}},
{{1,0,0,0},{1,0,0,0},{1,0,0,0},{1,0,0,0}},{{1,1,1,1},{0,0,0,0},{0,0,0,0},{0,0,0,0}},{{1,0,0,0},{1,0,0,0},{1,0,0,0},{1,0,0,0}}},{{
{1,1,0,0},{0,1,1,0},{0,0,0,0},{0,0,0,0}},{{0,1,0,0},{1,1,0,0},{1,0,0,0},{0,0,0,0}},{{1,1,0,0},{0,1,1,0},{0,0,0,0},{0,0,0,0}},{
{0,1,0,0},{1,1,0,0},{1,0,0,0},{0,0,0,0}}},{{{0,1,1,0},{1,1,0,0},{0,0,0,0},{0,0,0,0}},{{1,0,0,0},{1,1,0,0},{0,1,0,0},{0,0,0,0}},
{{0,1,1,0},{1,1,0,0},{0,0,0,0},{0,0,0,0}},{{1,0,0,0},{1,1,0,0},{0,1,0,0},{0,0,0,0}}},{{{0,1,0,0},{1,1,1,0},{0,0,0,0},{0,0,0,0}},
{{1,0,0,0},{1,1,0,0},{1,0,0,0},{0,0,0,0}},{{1,1,1,0},{0,1,0,0},{0,0,0,0},{0,0,0,0}},{{0,1,0,0},{1,1,0,0},{0,1,0,0},{0,0,0,0}}}};
char ch;
char block[] = "■";
char blank[] = "  ";
 int MAX_X() {
  int i;
  int max=0;
  for (i=0; i<4; i++) {
   if (stack_X[i] >= max) {
   max = stack_X[i];
   }
  }
 return max;
 }
 int MAX_Y() {
  int i;
  int max=0;
  for (i=0; i<4; i++) {
   if (stack_Y[i] > max) {
   max = stack_Y[i];
   }
  }
 return max;
 }
 int MIN_X() {
  int i;
  int max=0;
  max = stack_X[0];
  for (i=1; i<4; i++) {
   if (stack_X[i] < max) {
   max = stack_X[i];
   }
  }
 return max;
 }
 int MIN_Y() {
  int i;
  int max=0;
  max = stack_Y[0];
  for (i=1; i<4; i++) {
   if (stack_Y[i] < max) {
   max = stack_Y[i];
   }
  }
 return max;
 }
 void init() {
  int i, j;
  system("cls");
  for(i=0; i<MAP_Y; i++) {
   for (j=0; j<MAP_X; j++) {
    Board[j][i]=0;
   }
  }
  for (i=0; i<4; i++) {
   stack_X[i]=0;
   stack_Y[i]=0;
  }
 X = (MAP_X / 2);
 Y = 0;
 speed = 100;
 rocount = 0;
 JUMSU = 0;
 delay = 0;
 NEXT_SHAPE = -1;
 }
 void select_shape() {
  int i, j;
  int count = 0;
  srand((unsigned)time(NULL));
  
  if (NEXT_SHAPE==-1) NEXT_SHAPE = rand()%7;
  SHAPE_NUM = NEXT_SHAPE;
  rocount=0;
  for(i=0; i<4; i++) {
   for(j=0; j<4; j++) {
    if (SHAPE_ARY[SHAPE_NUM][0][i][j]==1) {
    stack_X[count]=j+X;
    stack_Y[count]=i+Y;
    Board[j+X][i+Y]=1;
    count++;
    }
   }
  }
  NEXT_SHAPE = rand()%7;
  for(i=0; i<4+2; i++) {
   for(j=0; j<4+2; j++) {
    gotoxy(MAP_X*2+j*2,i);
    if (i < 5 && j < 5 && i > 0 && j > 0) {
     gotoxy((MAP_X*2-2)+(j+1)*2,i+1);
     if (SHAPE_ARY[NEXT_SHAPE][0][i-1][j-1]==1) {     
      printf("%s",block);
     } else {
      printf("%s",blank);
     }
    } else printf("□");
   }
  }
 }
 int display() {
  int i, j;
  int max = 0;
  gotoxy(0,0);
   for(i=0; i<MAP_Y + 1; i++) {
    for(j=0; j<MAP_X + 1; j++) {
     if (Board[j][i]==2 && max==0) {
     max = i;
     }
     if (MAP_Y > i && MAP_X > j) {
      if(Board[j][i]>0) {
       printf("%s",block);
       //printf("%2d",Board[j][i]);
      } else {
       printf("%s",blank); 
      }
      
     } else printf("□"); 
    }
   printf("\n");
   }
  printf("Point : %d\nSpeed : %d\n",JUMSU,speed-100);
   if (max < 2 && max != 0) {
   system("pause");
   Sleep(1000);
   return 1;
   }
  return 0;
 }
 void KEY_PRESS() {
  int i;
  if (_kbhit()) {
  ch = getch();
   switch(ch) {
   case KEY_LEFT:
    if (LEFT_CHECK()) break;
    if (MIN_X() > 0) {
    LEFT();
    }
   break;
   case KEY_RIGHT:
    if (RIGHT_CHECK()) break;
    if (MAX_X() < MAP_X - 1) {
    RIGHT();
    }
   break;
   case KEY_DOWN:
    delay=speed+1;
    if (DOWN_CHECK()) break;
    if (MAX_Y() < MAP_Y - 1) {
    DOWN();
    }
   break;
   case KEY_ROTATE:
    if (ROTATE());
   break;
   case KEY_SPACE:
    i=0;
    while(!check()) {  
     DOWN();
     if(!(i%6)) {
      display();
     }
     i++;
    }
    if (check()) { 
    X=(MAP_X / 2);
    Y=0;
    LINE_CHECK();
     for (i=0; i<4; i++) {
     stack_X[i] = 0;
     stack_Y[i] = 0;
     }
    select_shape();
    display();
    }
   break;
   }
  }
 }
 void LEFT() {
  int i;
  for (i=0; i<4; i++) {
   Board[stack_X[i]--][stack_Y[i]]=0;
  }
  for (i=0; i<4; i++) {
   Board[stack_X[i]][stack_Y[i]]=1;
  } 
 }
 void RIGHT() {
  int i;
  for (i=0; i<4; i++) {
   Board[stack_X[i]++][stack_Y[i]]=0;
  }
  for (i=0; i<4; i++) {
   Board[stack_X[i]][stack_Y[i]]=1;
  } 
 }
 void DOWN() {
  int i;
  for (i=0; i<4; i++) {
   Board[stack_X[i]][stack_Y[i]++]=0;
  }
  for (i=0; i<4; i++) {
   Board[stack_X[i]][stack_Y[i]]=1;
  } 
 }
 int ROTATE() {
  int i, j;
  int count = 0; //X
  for (i=0; i<4; i++) {
   if (Board[MAX_X()+1][stack_Y[i]]==2 && MIN_X() > 0) {
   return -1;
   break;
   }
  }
  X = MIN_X();
  Y = MIN_Y();
  rocount++;
  for (i=0; i<4; i++) {
  Board[stack_X[i]][stack_Y[i]]=0;
  }
  if (rocount>3) rocount = 0;
  for(i=0; i<4; i++) {
   for(j=0; j<4; j++) {
    if (SHAPE_ARY[SHAPE_NUM][rocount][i][j]==1) {
    stack_X[count]=j+X;
    stack_Y[count]=i+Y;
    Board[j+X][i+Y]=1;
    count++;
    }
   }
  }
  while (MAX_X() > MAP_X - 1) {
  LEFT();
  }
  return 0;
 }
 int check() {
  int i;
  if (MAX_Y() == MAP_Y - 1) {
  KEY_PRESS();
   for (i=0; i<4; i++) {
   Board[stack_X[i]][stack_Y[i]]=2;
   }
  return 1;
  } else {
   if (DOWN_CHECK()) {
    for (i=0; i<4; i++) {
    Board[stack_X[i]][stack_Y[i]]=2;
    }
   return 1;
   }
  }
 return 0;
 }
 int DOWN_CHECK() {
  int i;
  for (i=0; i<4; i++) {
   if (Board[stack_X[i]][stack_Y[i]+1]==2) {
   return 1;
   break;
   }
  }
 return 0;
 }
 void LINE_CHECK() {
  int i,j;
  int z;
  int flag;
  for (i=0; i<MAP_Y; i++) {
  flag = 0;
   for (j=0; j<MAP_X; j++) { 
    if (Board[j][i]==0) {
    flag = 1;
    break;
    }
   }
  if (flag) continue;
  if ((speed-100)>9) JUMSU+=(speed-100);
  else JUMSU+=10;
  if (speed < 200) speed+=1;
   for (j=0; j<MAP_X; j++) {
   Board[j][i]=0;
   }
   for (z=i-1; z>0; z--) {
    for (j=0; j<MAP_X; j++) {
    Board[j][z+1] = Board[j][z];
    }
   } 
  }
 }
 void gotoxy(int x,int y) { 
  COORD pos={x,y};
  SetConsoleCursorPosition(GetStdHandle(STD_OUTPUT_HANDLE), pos); 
 }
 int LEFT_CHECK() {
  int i;
  for (i=0; i<4; i++) {
   if (Board[stack_X[i]-1][stack_Y[i]]==2) {
   return 1;
   break;
   }
  }
 return 0;
 }
 int RIGHT_CHECK() {
  int i;
  for (i=0; i<4; i++) {
   if (Board[stack_X[i]+1][stack_Y[i]]==2) {
   return 1;
   break;
   }
  }
 return 0;
 }
 void Viewer() {
  int i, j;
  int yCount=0;
  int flag = 0;
  for (i=0; i<MAP_Y; i++) {
   for (j=MIN_X(); j<=MAX_X(); j++) {
    if (Board[j][i]==2) {
     yCount = i;
     flag = 1;
     break;
    }
   }
   if (flag) break;
  }
  for (i=0; i<4; i++) {
  gotoxy(stack_X[i]*2,stack_Y[i]+(yCount-MIN_Y()-1)-(MAX_Y()-MIN_Y()));
  printf("□");
  }
  if (!flag) {
   for (i=0; i<4; i++) {
    gotoxy(stack_X[i]*2,stack_Y[i]+MAP_Y-MAX_Y()-1);
    printf("□");
   }
  }
 
 }
 void main() {
  int i;
  while(1) {
  init();
  select_shape();
  display();
  Viewer();
   while(1) {
   KEY_PRESS(); 
   if (display()) break;
   Viewer();
    if (delay > 200-speed) {
     if (check()) { 
     LINE_CHECK();     
      for (i=0; i<4; i++) {
      stack_X[i] = 0;
      stack_Y[i] = 0;
      }
     X=(MAP_X / 2);
     Y=0;
     select_shape();
     if (display()) break;
     Viewer();
     delay=0;
     continue;
     }
    DOWN();
    Viewer();
    delay = 0; 
    } 
   delay++;
   }
  }
 }