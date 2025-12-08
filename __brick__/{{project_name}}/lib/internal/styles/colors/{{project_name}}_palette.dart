import 'package:flutter/material.dart';
import 'package:{{project_name}}/domain/entities/entities.dart';

import 'base_palette.dart';

class {{project_name|pascalCase}}Palette extends BasePalette {
  const {{project_name|pascalCase}}Palette();

  @override
  CustomColor get primary => const CustomColor({
    100: Color(0xffFFFFFF),
    99: Color(0xffF9F8FF),
    98: Color(0xffF6F5FF),
    95: Color(0xffF5F3FF),
    90: Color(0xffFBC4AD),
    80: Color(0xffD4CBFF),
    70: Color(0xffBFB2FF),
    60: Color(0xffA186FF),
    50: Color(0xffCC452A),
    40: Color(0xffCC452A),
    35: Color(0xff6421E0),
    30: Color(0xff5C1ECF),
    25: Color(0xff4916A6),
    20: Color(0xff3D1489),
    15: Color(0xff310E7A),
    10: Color(0xffBE0F3E),
    5: Color(0xff1B0744),
    0: Color(0xff000000),
  });

  @override
  CustomColor get secondary => const CustomColor({
    100: Color(0xffFFFFFF),
    99: Color(0xffF9F8FF),
    98: Color(0xffF5F3FF),
    95: Color(0xffE2DDFF),
    90: Color(0xffA8F0DA),
    80: Color(0xffD4CBFF),
    70: Color(0xffBFB2FF),
    60: Color(0xffA186FF),
    50: Color(0xff114133),
    40: Color(0xff0B3B2D),
    35: Color(0xff6421E0),
    30: Color(0xff5C1ECF),
    25: Color(0xff4916A6),
    20: Color(0xff3D1489),
    15: Color(0xff310E7A),
    10: Color(0xff0F3429),
    5: Color(0xff0F3429),
    0: Color(0xff000000),
  });

  @override
  CustomColor get tertiary => const CustomColor({
    100: Color(0xffFFFFFF),
    99: Color(0xffFFFCF2),
    98: Color(0xffFFFDF3),
    95: Color(0xffFFF9E1),
    90: Color(0xffFEF3C7),
    80: Color(0xffFFF0B4),
    70: Color(0xffFDE68A),
    60: Color(0xffFFD961),
    50: Color(0xff0D97AC),
    40: Color(0xffFFB224),
    35: Color(0xffFBBF24),
    30: Color(0xffF59E0B),
    25: Color(0xffE87F0C),
    20: Color(0xffB45309),
    15: Color(0xff92400E),
    10: Color(0xff78350F),
    5: Color(0xff451A03),
    0: Color(0xff000000),
  });

  @override
  CustomColor get error => const CustomColor({
    100: Color(0xffFFFFFF),
    99: Color(0xffFFF7F7),
    98: Color(0xffFFF0F1),
    95: Color(0xffFFE2E6),
    90: Color(0xffFFCAD3),
    80: Color(0xffFF9EAE),
    70: Color(0xffFF6884),
    60: Color(0xffFF4F70),
    50: Color(0xffE2532F),
    40: Color(0xffE2532F),
    35: Color(0xffC9073C),
    30: Color(0xffBB0839),
    25: Color(0xffA8093A),
    20: Color(0xff940833),
    15: Color(0xff8A0C38),
    10: Color(0xff6E0626),
    5: Color(0xff450418),
    0: Color(0xff010101),
  });

  @override
  CustomColor get neutral => const CustomColor({
    100: Color(0xffFFFFFF),
    99: Color(0xffFDFBFF),
    98: Color(0xffFFFEFB),
    95: Color(0xffCBC5B4),
    90: Color(0xffCECECD),
    80: Color(0xffC5C6CD),
    70: Color(0xffAAABB1),
    60: Color(0xff8F9097),
    50: Color(0xff75777D),
    40: Color(0xff5D5E64),
    35: Color(0xff515258),
    30: Color(0xff45474C),
    25: Color(0xff393B41),
    20: Color(0xff2E3036),
    15: Color(0xff24262B),
    10: Color(0xff191C20),
    5: Color(0xff0F1116),
    0: Color(0xff000000),
  });

  @override
  CustomColor get neutralVariant => const CustomColor({
    100: Color(0xffFFFFFF),
    99: Color(0xffFDFBFF),
    98: Color(0xffFFFAF0),
    95: Color(0xffF0F0ED),
    90: Color(0xffDCDCDB),
    80: Color(0xffD6D6D5),
    70: Color(0xffA9ABB4),
    60: Color(0xff8E9099),
    50: Color(0xff74777F),
    40: Color(0xff5B5E66),
    35: Color(0xff4F525A),
    30: Color(0xff44474E),
    25: Color(0xff383B43),
    20: Color(0xff2D3038),
    15: Color(0xff23262D),
    10: Color(0xff181C22),
    5: Color(0xff0E1118),
    0: Color(0xff000000),
  });
}
