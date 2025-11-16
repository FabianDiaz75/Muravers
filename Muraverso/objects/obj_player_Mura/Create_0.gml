action= "idle";

//stats
hp=3;
defense=0.00;
damage=30;
range=5*16;
rangeX=3;
rangeY=3;
cooldownDamage =30;
damageDelayer=0;
invincible = false;
invincibility_duration = 60;
spd=8;
hsp=0;
vsp=0;
dir=0;
fullUlti=100;
chargeUlti=0;

//variables del dash
dashSpeed	= 40;
oldSpeed    = spd;
dashTime	= 8;
dashDelay	= dashTime * 4;
dashTimer	= 0;
dashDelayer = dashDelay;

//variables de direccion
hor=1
ver=1
lastSpeed	= [1,1];

//sprites
sprDash=spr_mura_dash;
sprIdle=spr_mura_idle;
sprRun=spr_mura_run;
sprAtack=spr_mura_attack;
sprDamage=spr_mura_damage;
sprDamageMask=spr_mura_damage_mask;
timeCharge=3
alpha = 1