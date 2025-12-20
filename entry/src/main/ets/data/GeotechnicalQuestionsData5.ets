/**
 * 岩土工程题目数据（第五部分）
 * HydroQuiz - 水利工程检测员刷题宝
 * 内容来源：岩土工程（岩石、土工、土工合成材料）第3版 第四节 岩石块体密度试验
 */
import { Question, QuestionType, DifficultyLevel } from '../common/types/QuestionTypes';
import { AppConstants } from '../common/constants/AppConstants';

/**
 * 获取岩土工程题目（第五部分）
 * 单选题20题(50%)、多选题8题(20%)、判断题12题(30%)
 */
export function getGeotechnicalQuestions5(timestamp: number): Question[] {
  return [
    // ========== 单选题 20题 ==========
    {
      id: 'geotechnical_161',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '岩石的块体密度是指单位体积的岩石质量，是岩石试件的质量与其体积之比。根据岩石试件含水状态，岩石的块体密度可分为（）三种。',
      options: [
        { key: 'A', content: '干密度、湿密度、饱和密度' },
        { key: 'B', content: '烘干密度、天然密度和饱和密度' },
        { key: 'C', content: '自然密度、压实密度、松散密度' },
        { key: 'D', content: '表观密度、堆积密度、紧密密度' }
      ],
      answer: 'B',
      analysis: '岩石的块体密度是指单位体积的岩石质量，是岩石试件的质量与其体积之比。根据岩石试件含水状态，岩石的块体密度可分为烘干密度、天然密度和饱和密度三种。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '块体密度', '分类'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_162',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '岩石块体密度采用（）测定。',
      options: [
        { key: 'A', content: '比重瓶法或环刀法' },
        { key: 'B', content: '量积法、水中称量法或密封法' },
        { key: 'C', content: '灌砂法或灌水法' },
        { key: 'D', content: '浮力法或排水法' }
      ],
      answer: 'B',
      analysis: '岩石块体密度采用量积法、水中称量法或密封法测定。水中称量法岩石块体密度按式(2-7)~式(2-9)计算。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '块体密度', '测定方法'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_163',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '岩石块体密度试验方法详见《水利水电工程岩石试验规程》（SL 264—2001）第（）页。',
      options: [
        { key: 'A', content: '10~12' },
        { key: 'B', content: '12~16' },
        { key: 'C', content: '16~18' },
        { key: 'D', content: '18~20' }
      ],
      answer: 'B',
      analysis: '岩石块体密度试验方法详见《水利水电工程岩石试验规程》（SL 264—2001）第12~16页。',
      difficulty: DifficultyLevel.HARD,
      tags: ['岩土工程', '块体密度', '规程'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_164',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '岩石的块体密度试验量积法适用于（）的岩石。',
      options: [
        { key: 'A', content: '遇水崩解' },
        { key: 'B', content: '能制备成规则试件' },
        { key: 'C', content: '不能用量积法或直接在水中称量' },
        { key: 'D', content: '密度小于1g/cm³' }
      ],
      answer: 'B',
      analysis: '岩石的块体密度试验量积法适用于能制备成规则试件的岩石；水中称量法适用于除遇水不崩解、不溶解和不干缩湿胀的其他各类岩石；密封法适用于不能用量积法或直接在水中称量进行试验的岩石。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '块体密度', '量积法'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_165',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '当采用密封法进行块体密度试验时，应同时测定岩石的（）。',
      options: [
        { key: 'A', content: '抗压强度' },
        { key: 'B', content: '天然含水率' },
        { key: 'C', content: '弹性模量' },
        { key: 'D', content: '抗拉强度' }
      ],
      answer: 'B',
      analysis: '当采用密封法进行块体密度试验时，应同时测定岩石的天然含水率。密封材料可选用石蜡或高分子树脂胶涂料。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '块体密度', '密封法'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_166',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '当采用水中称量法测定岩石块体密度时，一般用测定岩石含水率、自然吸水率和饱和吸水率的同一个试件。为了避免量积法测定岩石的块体密度时试件的体积误差影响试验成果，规程对标准试件的尺寸、偏差和测量精度均作了详细的规定。试件为边长（）mm的立方体。',
      options: [
        { key: 'A', content: '40±1' },
        { key: 'B', content: '50±1' },
        { key: 'C', content: '60±1' },
        { key: 'D', content: '70±1' }
      ],
      answer: 'B',
      analysis: '为了避免量积法测定岩石的块体密度时试件的体积误差影响试验成果，规程对标准试件的尺寸、偏差和测量精度均作了详细的规定。试件为边长50±1mm的立方体或直径与高均为50±1mm的圆柱体。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '块体密度', '试件尺寸'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_167',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '试件粉碎后的最大粒径应当不含闭合空隙。为此，全部颗粒应通过（）mm筛孔。',
      options: [
        { key: 'A', content: '0.15' },
        { key: 'B', content: '0.25' },
        { key: 'C', content: '0.50' },
        { key: 'D', content: '1.0' }
      ],
      answer: 'B',
      analysis: '试件粒径规定：试件粉碎后的最大粒径应当不含闭合空隙。为此，全部颗粒应通过0.25mm筛孔。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '颗粒密度', '粒径规定'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_168',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '经成都勘测设计院科研所对不同岩性的岩石进行的对比试验，当最大粒径加大到1.0mm和0.5mm时，与标准粒径（0.25mm）相比，其差值不超过（）g/cm³。',
      options: [
        { key: 'A', content: '0.005' },
        { key: 'B', content: '0.012' },
        { key: 'C', content: '0.025' },
        { key: 'D', content: '0.050' }
      ],
      answer: 'B',
      analysis: '经成都勘测设计院科研所对不同岩性的岩石进行的对比试验，当最大粒径加大到1.0mm和0.5mm时，与标准粒径（0.25mm）相比，其差值不超过0.012g/cm³，说明稍许加大粒径对测试成果影响不大。',
      difficulty: DifficultyLevel.HARD,
      tags: ['岩土工程', '颗粒密度', '粒径影响'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_169',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '采用比重瓶法测定岩石颗粒密度时，岩粉的烘干时间可根据不同岩性的岩石而定，规定其烘干时间不得少于（）h。',
      options: [
        { key: 'A', content: '4' },
        { key: 'B', content: '6' },
        { key: 'C', content: '8' },
        { key: 'D', content: '10' }
      ],
      answer: 'B',
      analysis: '试件烘干时间规定：根据成都勘测设计院科研所对不同烘干时间、不同岩性的岩石进行的比较试验成果，采用比重瓶法测定岩石颗粒密度时，岩粉的烘干时间可根据不同岩性的岩石而定，规定其烘干时间不得少于6h，一般坚硬岩类为6~8h，黏土岩类软质岩为8~10h。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '颗粒密度', '烘干时间'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_170',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '一般坚硬岩类烘干时间为（）h。',
      options: [
        { key: 'A', content: '4~6' },
        { key: 'B', content: '6~8' },
        { key: 'C', content: '8~10' },
        { key: 'D', content: '10~12' }
      ],
      answer: 'B',
      analysis: '规定其烘干时间不得少于6h，一般坚硬岩类为6~8h，黏土岩类软质岩为8~10h。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '颗粒密度', '烘干时间'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_171',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '黏土岩类软质岩烘干时间为（）h。',
      options: [
        { key: 'A', content: '4~6' },
        { key: 'B', content: '6~8' },
        { key: 'C', content: '8~10' },
        { key: 'D', content: '10~12' }
      ],
      answer: 'C',
      analysis: '规定其烘干时间不得少于6h，一般坚硬岩类为6~8h，黏土岩类软质岩为8~10h。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '颗粒密度', '烘干时间'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_172',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '比重瓶的大小一般对测试成果影响不大。原长春综合研究院的比较试验成果说明了这一点，据此，规程规定（）mL的短颈比重瓶作为试验标准瓶。',
      options: [
        { key: 'A', content: '50' },
        { key: 'B', content: '100' },
        { key: 'C', content: '150' },
        { key: 'D', content: '200' }
      ],
      answer: 'B',
      analysis: '比重瓶的大小一般对测试成果影响不大。原长春综合研究院的比较试验成果说明了这一点，据此，规程规定100mL的短颈比重瓶作为试验标准瓶。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '颗粒密度', '比重瓶'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_173',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '根据不同容积比重瓶测定的颗粒密度表，用50mL比重瓶测定黏土的颗粒密度为（）g/cm³。',
      options: [
        { key: 'A', content: '2.604' },
        { key: 'B', content: '2.620' },
        { key: 'C', content: '2.672' },
        { key: 'D', content: '2.739' }
      ],
      answer: 'D',
      analysis: '根据不同容积比重瓶测定的颗粒密度表，用50mL比重瓶测定黏土的颗粒密度为2.739g/cm³，用100mL比重瓶测定为2.734g/cm³。',
      difficulty: DifficultyLevel.HARD,
      tags: ['岩土工程', '颗粒密度', '黏土'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_174',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '比重瓶的校正有两种方法，即称量校正法和计算校正法。据南京水科院的比较试验资料，两者误差不大，因此规程推荐使用（）。',
      options: [
        { key: 'A', content: '称量校正法' },
        { key: 'B', content: '计算校正法' },
        { key: 'C', content: '两种方法均可' },
        { key: 'D', content: '不需要校正' }
      ],
      answer: 'B',
      analysis: '比重瓶的校正有两种方法，即称量校正法和计算校正法，据南京水科院的比较试验资料，两者误差不大，因此规程推荐使用计算校正法。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '颗粒密度', '比重瓶校正'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_175',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '用水中称量法计算岩石的颗粒密度略小于比重瓶法测定的颗粒密度值，其差别随闭合空隙的增大而（）。',
      options: [
        { key: 'A', content: '减小' },
        { key: 'B', content: '增加' },
        { key: 'C', content: '不变' },
        { key: 'D', content: '无规律' }
      ],
      answer: 'B',
      analysis: '经比较，水中称量法计算的颗粒密度略小于比重瓶法测定的颗粒密度值，其差别随闭合空隙的增大而增加。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '颗粒密度', '方法比较'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_176',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '根据比重瓶法与水中称量法试验成果比较表，广东下桥电站对水岩进行133次试验，差值在±0.01mm范围内的概率为（）%。',
      options: [
        { key: 'A', content: '30.7' },
        { key: 'B', content: '45.1' },
        { key: 'C', content: '56.8' },
        { key: 'D', content: '63.6' }
      ],
      answer: 'B',
      analysis: '根据比重瓶法与水中称量法试验成果比较表，广东下桥电站对水岩进行133次试验，差值在±0.01mm范围内的概率为45.1%。',
      difficulty: DifficultyLevel.HARD,
      tags: ['岩土工程', '颗粒密度', '方法比较'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_177',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '根据试件不同粒径大小测定的颗粒密度表，石灰岩在粒径<0.25mm时的颗粒密度为（）g/cm³。',
      options: [
        { key: 'A', content: '2.841' },
        { key: 'B', content: '2.843' },
        { key: 'C', content: '2.888' },
        { key: 'D', content: '2.891' }
      ],
      answer: 'D',
      analysis: '根据试件不同粒径大小测定的颗粒密度表，石灰岩在粒径<0.25mm时的颗粒密度为2.891g/cm³。',
      difficulty: DifficultyLevel.HARD,
      tags: ['岩土工程', '颗粒密度', '石灰岩'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_178',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '岩石块体密度试验主要仪器和设备包括钻石机、切石机、磨石机、车床、烘箱、干燥器、天平（感量0.01g）、测量平台、石蜡及融蜡设备、水中称量装置、高分子树脂胶涂料及配制涂料的用具等。试验记录应包括工程名称、岩石名称、试件编号、试件描述、试验方法、试件在各种含水状态下的质量、试件水中称量、试件尺寸、水的密度、石蜡或高分子树脂胶的密度、试验人员和（）等。',
      options: [
        { key: 'A', content: '试验温度' },
        { key: 'B', content: '试验日期' },
        { key: 'C', content: '试验地点' },
        { key: 'D', content: '试验设备型号' }
      ],
      answer: 'B',
      analysis: '试验记录应包括工程名称、岩石名称、试件编号、试件描述、试验方法、试件在各种含水状态下的质量、试件水中称量、试件尺寸、水的密度、石蜡或高分子树脂胶的密度、试验人员、试验日期等。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '块体密度', '试验记录'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_179',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '水中称量法还可以连续测定岩石的颗粒密度、块体密度、含水率、自然吸水率和饱和吸水率，对简化测试手续有较多的优点。所以，规程将此法列入测定岩石颗粒密度和（）的测试方法。',
      options: [
        { key: 'A', content: '抗压强度' },
        { key: 'B', content: '块体密度' },
        { key: 'C', content: '弹性模量' },
        { key: 'D', content: '抗拉强度' }
      ],
      answer: 'B',
      analysis: '水中称量法还可以连续测定岩石的颗粒密度、块体密度、含水率、自然吸水率和饱和吸水率，对简化测试手续有较多的优点。所以，规程将此法列入测定岩石颗粒密度和块体密度的测试方法。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '水中称量法', '优点'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_180',
      type: QuestionType.SINGLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '密封材料可选用石蜡或（）。',
      options: [
        { key: 'A', content: '水泥浆' },
        { key: 'B', content: '高分子树脂胶涂料' },
        { key: 'C', content: '沥青' },
        { key: 'D', content: '环氧树脂' }
      ],
      answer: 'B',
      analysis: '当采用密封法进行块体密度试验时，应同时测定岩石的天然含水率。密封材料可选用石蜡或高分子树脂胶涂料。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '块体密度', '密封材料'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 多选题 8题 ==========
    {
      id: 'geotechnical_181',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '根据岩石试件含水状态，岩石的块体密度可分为（）。',
      options: [
        { key: 'A', content: '烘干密度' },
        { key: 'B', content: '天然密度' },
        { key: 'C', content: '饱和密度' },
        { key: 'D', content: '压实密度' }
      ],
      answer: 'A,B,C',
      analysis: '根据岩石试件含水状态，岩石的块体密度可分为烘干密度、天然密度和饱和密度三种。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '块体密度', '分类'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_182',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '岩石块体密度采用（）测定。',
      options: [
        { key: 'A', content: '量积法' },
        { key: 'B', content: '水中称量法' },
        { key: 'C', content: '密封法' },
        { key: 'D', content: '环刀法' }
      ],
      answer: 'A,B,C',
      analysis: '岩石块体密度采用量积法、水中称量法或密封法测定。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '块体密度', '测定方法'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_183',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '岩石块体密度试验主要仪器和设备包括（）。',
      options: [
        { key: 'A', content: '钻石机、切石机、磨石机、车床' },
        { key: 'B', content: '烘箱、干燥器、天平（感量0.01g）' },
        { key: 'C', content: '测量平台、石蜡及融蜡设备' },
        { key: 'D', content: '水中称量装置、高分子树脂胶涂料及配制涂料的用具' }
      ],
      answer: 'A,B,C,D',
      analysis: '岩石块体密度试验主要仪器和设备包括钻石机、切石机、磨石机、车床、烘箱、干燥器、天平（感量0.01g）、测量平台、石蜡及融蜡设备、水中称量装置、高分子树脂胶涂料及配制涂料的用具等。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '块体密度', '试验设备'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_184',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '水中称量法可以连续测定岩石的（）。',
      options: [
        { key: 'A', content: '颗粒密度、块体密度' },
        { key: 'B', content: '含水率' },
        { key: 'C', content: '自然吸水率和饱和吸水率' },
        { key: 'D', content: '抗压强度' }
      ],
      answer: 'A,B,C',
      analysis: '水中称量法还可以连续测定岩石的颗粒密度、块体密度、含水率、自然吸水率和饱和吸水率，对简化测试手续有较多的优点。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '水中称量法', '测定内容'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_185',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '岩石块体密度试验记录应包括（）。',
      options: [
        { key: 'A', content: '工程名称、岩石名称、试件编号、试件描述' },
        { key: 'B', content: '试验方法、试件在各种含水状态下的质量' },
        { key: 'C', content: '试件水中称量、试件尺寸、水的密度' },
        { key: 'D', content: '石蜡或高分子树脂胶的密度、试验人员、试验日期' }
      ],
      answer: 'A,B,C,D',
      analysis: '试验记录应包括工程名称、岩石名称、试件编号、试件描述、试验方法、试件在各种含水状态下的质量、试件水中称量、试件尺寸、水的密度、石蜡或高分子树脂胶的密度、试验人员、试验日期等。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '块体密度', '试验记录'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_186',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '根据比重瓶法与水中称量法试验成果比较表，以下哪些单位进行了相关试验（）。',
      options: [
        { key: 'A', content: '广东下桥电站' },
        { key: 'B', content: '广西龙滩电站' },
        { key: 'C', content: '成都院地质学院' },
        { key: 'D', content: '四川省水利院' }
      ],
      answer: 'A,B,C,D',
      analysis: '根据比重瓶法与水中称量法试验成果比较表，广东下桥电站、广西龙滩电站、大化电站、小浪底水库、百马电站、白马电站、龙滩地质学院、成都院地质学院、石塘水库、板桥水库、四川省水利院、长科院、湖南省水电院、成都院科研所、东北院科研所、河南省水科所等单位都进行了相关试验。',
      difficulty: DifficultyLevel.HARD,
      tags: ['岩土工程', '颗粒密度', '试验单位'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_187',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '根据不同容积比重瓶测定的颗粒密度表，以下土的名称中进行了50mL和100mL比重瓶对比测定的有（）。',
      options: [
        { key: 'A', content: '黏土' },
        { key: 'B', content: '黏土' },
        { key: 'C', content: '砂质黏土' },
        { key: 'D', content: '砂壤土' }
      ],
      answer: 'A,B,C,D',
      analysis: '根据不同容积比重瓶测定的颗粒密度表，黏土、黏土、砂质黏土、砂原黏土、砂壤土、砂土等都进行了50mL和100mL比重瓶对比测定。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '颗粒密度', '比重瓶'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_188',
      type: QuestionType.MULTIPLE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '根据试件不同粒径大小测定的颗粒密度表，以下岩石中进行了不同粒径对比试验的有（）。',
      options: [
        { key: 'A', content: '石灰岩' },
        { key: 'B', content: '页岩' },
        { key: 'C', content: '花岗岩' },
        { key: 'D', content: '玄武岩' }
      ],
      answer: 'A,B,C,D',
      analysis: '根据试件不同粒径大小测定的颗粒密度表，石灰岩、页岩、花岗岩、流纹岩、玄武岩、砂岩、泥质页岩、砂质页岩、细砂岩、砂岩等岩石都进行了不同粒径对比试验。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '颗粒密度', '粒径'],
      createTime: timestamp,
      updateTime: timestamp
    },

    // ========== 判断题 12题 ==========
    {
      id: 'geotechnical_189',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '岩石的块体密度是指单位体积的岩石质量，是岩石试件的质量与其体积之比。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。岩石的块体密度是指单位体积的岩石质量，是岩石试件的质量与其体积之比。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '块体密度', '定义'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_190',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '用水中称量法计算岩石的颗粒密度，是假定水全部充满岩石试件的空隙。但实际上岩石是由矿物颗粒、闭合空隙和开敞空隙3部分组成，水只能充满其中开敞空隙部分。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。用水中称量法计算岩石的颗粒密度，是假定水全部充满岩石试件的空隙。但实际上岩石是由矿物颗粒、闭合空隙和开敞空隙3部分组成，水只能充满其中开敞空隙部分。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '颗粒密度', '水中称量法'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_191',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '经大量的试验研究资料分析，水中称量法计算的颗粒密度与比重瓶法测定的颗粒密度值存在着一定差别，但差值不大，其测定值可以满足中小型水利工程各设计阶段以及大型水利工程前期可行性和初步设计阶段的需要。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。经大量的试验研究资料分析，水中称量法计算的颗粒密度与比重瓶法测定的颗粒密度值存在着一定差别，但差值不大，其测定值可以满足中小型水利工程各设计阶段以及大型水利工程前期可行性和初步设计阶段的需要。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '颗粒密度', '方法比较'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_192',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '量积法适用于能制备成规则试件的岩石。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。岩石的块体密度试验量积法适用于能制备成规则试件的岩石。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '块体密度', '量积法'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_193',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '水中称量法适用于除遇水不崩解、不溶解和不干缩湿胀的其他各类岩石。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'B',
      analysis: '错误。水中称量法适用于除遇水崩解、溶解和干缩湿胀以外的其他各类岩石（不是"不崩解、不溶解和不干缩湿胀"）。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '块体密度', '水中称量法'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_194',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '密封法适用于不能用量积法或直接在水中称量进行试验的岩石。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。密封法适用于不能用量积法或直接在水中称量进行试验的岩石。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '块体密度', '密封法'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_195',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '稍许加大粒径对测试成果影响不大，因此没有必要进一步减小试件粒径。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。经成都勘测设计院科研所对不同岩性的岩石进行的对比试验，当最大粒径加大到1.0mm和0.5mm时，与标准粒径（0.25mm）相比，其差值不超过0.012g/cm³，说明稍许加大粒径对测试成果影响不大，因此没有必要进一步减小试件粒径。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '颗粒密度', '粒径影响'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_196',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '比重瓶的校正对测定颗粒密度成果精确程度有一定的影响，对新购置的比重瓶在试验前应进行校正，对长期使用的比重瓶应该使用一段时间后校正一次。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。比重瓶的校正对测定颗粒密度成果精确程度有一定的影响，对新购置的比重瓶在试验前应进行校正，对长期使用的比重瓶应该使用一段时间后校正一次。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '颗粒密度', '比重瓶校正'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_197',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '试件为边长50±1mm的立方体或直径与高均为50±1mm的圆柱体。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。为了避免量积法测定岩石的块体密度时试件的体积误差影响试验成果，规程对标准试件的尺寸、偏差和测量精度均作了详细的规定。试件为边长50±1mm的立方体或直径与高均为50±1mm的圆柱体。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '块体密度', '试件尺寸'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_198',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '根据比重瓶校正法和计算法成果比较表，两种方法测定的颗粒密度误差不大。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。比重瓶的校正有两种方法，即称量校正法和计算校正法，据南京水科院的比较试验资料，两者误差不大，因此规程推荐使用计算校正法。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '颗粒密度', '比重瓶校正'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_199',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '根据不同烘干时间的成果比较表，砂岩在烘干7h、12h和26h后的质量变化很小，说明砂岩烘干时间达到7h后基本稳定。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。根据不同烘干时间的成果比较表，砂岩在烘干7h（330.87g）、12h（330.84g）和26h（330.82g）后的质量变化很小，说明砂岩烘干时间达到7h后基本稳定。',
      difficulty: DifficultyLevel.MEDIUM,
      tags: ['岩土工程', '颗粒密度', '烘干时间'],
      createTime: timestamp,
      updateTime: timestamp
    },
    {
      id: 'geotechnical_200',
      type: QuestionType.JUDGE,
      subjectId: AppConstants.SUBJECT_GEOTECHNICAL_ROCK,
      chapter: '第二章 岩石物理性质试验',
      content: '岩石块体天然密度用ρ0表示，岩石块体干密度用ρd表示，岩石块体饱和密度用ρs表示。',
      options: [
        { key: 'A', content: '正确' },
        { key: 'B', content: '错误' }
      ],
      answer: 'A',
      analysis: '正确。式中ρ0——岩石块体天然密度，g/cm³；ρd——岩石块体干密度，g/cm³；ρs——岩石块体饱和密度，g/cm³。',
      difficulty: DifficultyLevel.EASY,
      tags: ['岩土工程', '块体密度', '符号'],
      createTime: timestamp,
      updateTime: timestamp
    }
  ];
}
