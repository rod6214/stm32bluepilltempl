
    .cpu cortex-m3
    .thumb

    .text
    .section .__vectors, "ax"
    .global __vector_table
__vector_table:
    .word __stack_top
    .word Reset_Handler                   @-3
    .word NMI_Handler                     @-2
    .word HardFault_Handler               @-1
    .word MemManage_Handler               @0
    .word BusFault_Handler                @1
    .word UsageFault_Handler              @2
    .word 0
    .word SVCall_Handler                  @3
    .word Debug_Handler                   @4
    .word 0
    .word PendSV_Handler                  @5
    .word SysTick_Handler                 @6
    .word WWDG_Handler                    @7
    .word PVD_Handler                     @8
    .word TAMPER_Handler                  @9
    .word RTC_Handler                     @10
    .word FLASH_Handler                   @11
    .word RCC_Handler                     @12
    .word EXTI0_Handler                   @13
    .word EXTI1_Handler                   @14
    .word EXTI2_Handler                   @15
    .word EXTI3_Handler                   @16
    .word EXTI4_Handler                   @17
    .word DMA1_Channel1_Handler           @18
    .word DMA1_Channel2_Handler           @19
    .word DMA1_Channel3_Handler           @20
    .word DMA1_Channel4_Handler           @21
    .word DMA1_Channel5_Handler           @22
    .word DMA1_Channel6_Handler           @23
    .word DMA1_Channel7_Handler           @24
    .word ADC1_2_Handler                  @25
    .word CAN1_TX_Handler                 @26
    .word CAN1_RX0_Handler                @27
    .word CAN1_RX1_Handler                @28
    .word CAN1_SCE_Handler                @29
    .word EXTI9_5_Handler                 @30
    .word TIM1_BRK_Handler                @31
    .word TIM1_UP_Handler                 @32
    .word TIM1_TRG_COM_Handler            @33
    .word TIM1_CC_Handler                 @34
    .word TIM2_Handler                    @35
    .word TIM3_Handler                    @36
    .word TIM4_Handler                    @37
    .word I2C1_EV_Handler                 @38
    .word I2C1_ER_Handler                 @39
    .word I2C2_EV_Handler                 @40
    .word I2C2_ER_Handler                 @41
    .word SPI1_Handler                    @42
    .word SPI2_Handler                    @43
    .word USART1_Handler                  @44
    .word USART2_Handler                  @45
    .word USART3_Handler                  @46
    .word EXTI15_Handler                  @47
    .word RTCAlarm_Handler                @48

    .section .__init
    .type Reset_Handler, %function
    .global Reset_Handler
Reset_Handler:
    nop
    ldr r0,=(clock_config)
    blx r0
    nop
    ldr r0,=(main)
    blx r0
    nop
    ldr r0,=(end)
    bx r0
    b Reset_Handler

    .global default_handler
    .type default_handler,%function
    .thumb
default_handler:
    bkpt #0

    @------- Macros
    .macro weak_fn name, dummy_fn
    .weak \name
    .thumb_set \name, \dummy_fn
    .endm


    @ weak_fn Reset_Handler,default_handler                   @-3
    weak_fn NMI_Handler,default_handler                     @-2
    weak_fn HardFault_Handler,default_handler               @-1
    weak_fn MemManage_Handler,default_handler               @0
    weak_fn BusFault_Handler,default_handler                @1
    weak_fn UsageFault_Handler,default_handler              @2
    weak_fn SVCall_Handler,default_handler                  @3
    weak_fn Debug_Handler,default_handler                   @4
    weak_fn PendSV_Handler,default_handler                  @5
    weak_fn SysTick_Handler,default_handler                 @6
    weak_fn WWDG_Handler,default_handler                    @7
    weak_fn PVD_Handler,default_handler                    @8
    weak_fn TAMPER_Handler,default_handler                  @9
    weak_fn RTC_Handler,default_handler                    @10
    weak_fn FLASH_Handler,default_handler                   @11
    weak_fn RCC_Handler,default_handler                     @12
    weak_fn EXTI0_Handler,default_handler                   @13
    weak_fn EXTI1_Handler,default_handler                   @14
    weak_fn EXTI2_Handler,default_handler                   @15
    weak_fn EXTI3_Handler,default_handler                   @16
    weak_fn EXTI4_Handler,default_handler                   @17
    weak_fn DMA1_Channel1_Handler,default_handler           @18
    weak_fn DMA1_Channel2_Handler,default_handler           @19
    weak_fn DMA1_Channel3_Handler,default_handler           @20
    weak_fn DMA1_Channel4_Handler,default_handler           @21
    weak_fn DMA1_Channel5_Handler,default_handler           @22
    weak_fn DMA1_Channel6_Handler,default_handler           @23
    weak_fn DMA1_Channel7_Handler,default_handler           @24
    weak_fn ADC1_2_Handler,default_handler                  @25
    weak_fn CAN1_TX_Handler,default_handler                 @26
    weak_fn CAN1_RX0_Handler,default_handler                @27
    weak_fn CAN1_RX1_Handler,default_handler                @28
    weak_fn CAN1_SCE_Handler,default_handler                @29
    weak_fn EXTI9_5_Handler,default_handler                 @30
    weak_fn TIM1_BRK_Handler,default_handler                @31
    weak_fn TIM1_UP_Handler,default_handler                 @32
    weak_fn TIM1_TRG_COM_Handler,default_handler            @33
    weak_fn TIM1_CC_Handler,default_handler                 @34
    weak_fn TIM2_Handler,default_handler                    @35
    weak_fn TIM3_Handler,default_handler                    @36
    weak_fn TIM4_Handler,default_handler                    @37
    weak_fn I2C1_EV_Handler,default_handler                 @38
    weak_fn I2C1_ER_Handler,default_handler                 @39
    weak_fn I2C2_EV_Handler,default_handler                 @40
    weak_fn I2C2_ER_Handler,default_handler                 @41
    weak_fn SPI1_Handler,default_handler                    @42
    weak_fn SPI2_Handler,default_handler                    @43
    weak_fn USART1_Handler,default_handler                  @44
    weak_fn USART2_Handler,default_handler                  @45
    weak_fn USART3_Handler,default_handler                  @46
    weak_fn EXTI15_Handler,default_handler                  @47
    weak_fn RTCAlarm_Handler,default_handler                @48



    .section .sprog, "ax"
    .global test_prog
    .type test_prog,%function
    .thumb
test_prog:
    nop
    b test_prog