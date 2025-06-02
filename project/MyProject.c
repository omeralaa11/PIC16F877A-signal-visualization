
void main() {
int Vin;
int pwm=0;                                                                                                                           35353
char buffer[6];
PWM1_Init(10000);
PWM1_Set_Duty(70);
UART1_Init(9600);
TRISC = 0x10111011;
PORTC = 0;
TRISA= 0xff;
ADCON1= 0x80;
PWM1_Start();
while(1)
{
 Vin=ADC_Read(0);
 WordToStr(Vin, buffer);
UART1_Write_Text(buffer);
UART1_Write('\r');
UART1_Write('\n');
pwm = Vin/4;
PWM1_Set_Duty(pwm);
delay_ms(100);
}
}