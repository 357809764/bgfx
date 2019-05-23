#ifndef _BX_CONST_H_
#define _BX_CONST_H_

#ifndef BX_VS2013
#define BX_VS2013
#endif

//#ifndef BX_VS2017
//#define BX_VS2017
//#endif

//#if (_MSC_VER == 1800) // 2013
//#define BX_VS2013
//#elif (_MSC_VER >= 1911) // 2013
//#define BX_VS2017
//#endif  


#ifndef BX_CONSTEXPR

#ifdef BX_VS2017

#define BX_CONSTEXPR constexpr
#define BX_CONSTEXPR_VAR constexpr
#else

#define BX_CONSTEXPR 
#define BX_CONSTEXPR_VAR const 
#endif 

#endif
#endif
