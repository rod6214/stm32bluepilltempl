/** RCC definitions */
#define RCC_BASE        (0x40021000UL)
#define RCC_CR          (RCC_BASE)
#define RCC_CFGR        (RCC_BASE + 4)
#define RCC_CIR         (RCC_BASE + 8)
#define RCC_APB2RSTR    (RCC_BASE + 0x0c)
#define RCC_APB1RSTR    (RCC_BASE + 0x10)
#define RCC_AHBENR      (RCC_BASE + 0x14)
#define RCC_APB2ENR     (RCC_BASE + 0x18)
#define RCC_APB1ENR     (RCC_BASE + 0x1c)
#define RCC_CSR         (RCC_BASE + 0x24)
#define RCC_AHBRSTR     (RCC_BASE + 0x28)
#define RCC_CFGR2       (RCC_BASE + 0x2c)
/** GPIOB definitions */
#define GPIOB_BASE      (0x40010C00UL)
#define GPIOB_CRL       (GPIOB_BASE)
#define GPIOB_CRH       (GPIOB_BASE + 4)
#define GPIOB_IDR       (GPIOB_BASE + 8)
#define GPIOB_ODR       (GPIOB_BASE + 0x0c)
#define GPIOB_BSRR      (GPIOB_BASE + 0x10)
#define GPIOB_BRR       (GPIOB_BASE + 0x14)
#define GPIOB_LCKR      (GPIOB_BASE + 0x18)

/** Bit binding */
#define BIT_BIND(bit_band_base, byte_offset, bit_number) (bit_band_base + (byte_offset * 32) + (bit_number * 4))

#define BIND_RAM(offset, bit) BIT_BIND(0x22000000, offset, bit)

