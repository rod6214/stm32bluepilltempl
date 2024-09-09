#include <stm32f1xx.h>

#define wait_until(x) do {asm("nop");}while(x)
#define wait_cycles(x, times) do {x++;}while(x<times)

void clock_config() {
    if ((RCC->CR)&(RCC_CR_PLLON))
        RCC->CR &= ~RCC_CR_PLLON;

    RCC->CR |= RCC_CR_HSION;
    wait_until(!((RCC->CR)&(RCC_CR_HSION)));

    if ((RCC->CFGR)&(RCC_CFGR_SWS) != 0) {
        RCC->CFGR &= ~RCC_CFGR_SW;
    }

    RCC->CFGR &= ~RCC_CFGR_PLLXTPRE;

    RCC->CFGR &= ~(15<<RCC_CFGR_PLLMULL_Pos);
    RCC->CFGR |= (7<<RCC_CFGR_PLLMULL_Pos);
    
    RCC->CFGR &= ~(RCC_CFGR_MCO);
    RCC->CFGR |= (RCC_CFGR_MCO_PLLCLK_DIV2);

    RCC->CR |= RCC_CR_HSEON;
    wait_until(!((RCC->CR)&(RCC_CR_HSERDY)));
    RCC->CR |= RCC_CR_CSSON;
    wait_until(!((RCC->CR)&(RCC_CR_CSSON)));

    RCC->CFGR |= 2<<RCC_CFGR_SW_Pos;
    RCC->CFGR |= (RCC_CFGR_PLLSRC);
    RCC->CFGR |= (RCC_CFGR_USBPRE);
    RCC->CFGR |= (4<<RCC_CFGR_PPRE1_Pos);
    RCC->CFGR &= ~(15<<RCC_CFGR_PPRE2_Pos);
    FLASH->ACR |= FLASH_ACR_LATENCY_2;
    
    RCC->CR |= RCC_CR_PLLON;
    
    wait_until(!((RCC->CR)&(RCC_CR_PLLRDY)));

    RCC->APB2ENR |= RCC_APB2ENR_IOPAEN;
    GPIOA->CRH = 0b1011;
}

void end(){}
