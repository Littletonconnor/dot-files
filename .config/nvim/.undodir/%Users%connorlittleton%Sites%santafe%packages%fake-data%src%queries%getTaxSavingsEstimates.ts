Vim�UnDo� �����\J��Z�m٠0c��_h�sΣ  �       }  )                          g^ J    _�                           ����                                                                                                                                                                                                                                                                                                                                                             g^ E     �      �    5��                         �.                     �                        �.                     �                         �.                     5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             g^ E     �    +  �    �      �    5��                         �.              �      5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             g^ F    �               5��                         �.                     5�_�                   )       ����                                                                                                                                                                                                                                                                                                                                                             g^ I    �  (  *  �          }5��    (                    �0                     5�_�                    )       ����                                                                                                                                                                                                                                                                                                                                                             g^ I    �         �      Limport { TaxSavingsEstimate, TaxSavingsEstimates } from 'wf-typescript-api';   Fimport { WealthfrontApiReturnType } from '../wealthfront-api-factory';�        �        {   $    header: 'Time-weighted returns',  |    body: 'You currently have a time-weighted return of 12%. This is the amount that the securities in your Wealthfront portfolio have grown during this time period, regardless of how much money you’ve invested.\n\nThis is a good measure of Wealthfront’s performance as an investment advisor because it shows how the investments we selected for you have performed over time.',     },     {   %    header: 'Money-weighted returns',  1    body: 'Your money-weighted return is currently 11%. This is your average return on your deposits during this time period, which is influenced by your portfolio’s performance and the timing of your deposits (i.e., if you happen to make a large deposit right before the market jumps, your average return goes up).\n\nThis is a good measure of your returns over time, and of your deposit timing (though we advise against trying to time the market). If you want to evaluate our performance as an investment advisor, Time-Weighted Return is a better measure.',     },     {   !    header: 'Like what you see?',   _    body: 'Share with a friend, and you could both get an additional $5,000 managed for free.',     },�         �        {   #    header: 'What is this number?',   �    body: 'Dividends are payments companies make to pass income to their investors. This number represents the dividends you’ve received so far in 2020.',     },     {   !    header: 'What does it mean?',  *    body: 'Our software uses dividends to help keep your tax bill low.\n\nWe use dividends to rebalance your portfolio. Over time, your portfolio’s asset allocation will drift as some asset classes outperform others. When you receive dividends, our software reinvests them in underweight asset classes, moving you closer to your target allocation with fewer tax consequences.\n\nBuying additional shares also means you’ll have more tax lots in your portfolio. This translates into more opportunities for our software to conduct tax-loss harvesting.',     },     {   !    header: 'Like what you see?',   _    body: 'Share with a friend, and you could both get an additional $5,000 managed for free.',     },�   "   +  �        {   #    header: 'What is this number?',   �    body: 'Dividends are payments companies make to pass income to their investors. This number represents the dividends you’ve received so far in 2020.',     },     {   !    header: 'What does it mean?',  *    body: 'Our software uses dividends to help keep your tax bill low.\n\nWe use dividends to rebalance your portfolio. Over time, your portfolio’s asset allocation will drift as some asset classes outperform others. When you receive dividends, our software reinvests them in underweight asset classes, moving you closer to your target allocation with fewer tax consequences.\n\nBuying additional shares also means you’ll have more tax lots in your portfolio. This translates into more opportunities for our software to conduct tax-loss harvesting.',     },�   -   =  �        {   m    body: 'The amount we estimate you may be able to save on your taxes because of our Tax-Loss Harvesting.',   #    header: 'What is this number?',       linkText: 'Learn more',   h    linkUrl: 'https://support.wealthfront.com/hc/en-us/articles/209348486-What-is-Tax-Loss-Harvesting-',     },     {  �    body: 'We took your estimated tax savings for each year (calculated from your tax loss harvested for that year) and summed them together. We did not account for potential tax loss carryforward, which could lower your tax bill further.\n\nBased on your reported location and income, we assumed you would pay 28% federal income tax, 5% state income tax, and a 15% tax rate on your long-term capital gains. This means you could save an estimated $817.96 in taxes.',   %    header: 'How was it calculated?',     },     {      body: 'Net of our fees, you\u2019re still ahead by $808.29. Wealthfront attempts to maximize your after-tax returns by using software to automate tax-loss harvesting.\n\nLike what you see? Share with a friend, and you could both get an additional $5,000 managed for free.',       header: 'Did you know...',     },�   >   a  �   "   
  return {       balanceDetails: {   D      description: 'In 2021, your balance has increased by $999.68',         dividendsReceived: value,         earnings: value * -0.315,   $      marketChanges: value * -0.315,         netDeposits: value * 10,         advisoryFees: value + 2,       },       dividendsEarned: value,       pendingDividends: 0.01,   7    pendingDividendsExpectation: 'Determined on Oct 2',   ,    totalDividendsWithPending: value + 0.01,       dividendsEarnedTooltip,       pendingDividendsTooltip,       feesPaid: value,   5    insertTaxSavingsTooltipTableAfterSectionIndex: 1,   +    moneyWeightedReturn: (value - 1) / 100,       realizedGain: value,   &    realizedLongTermGain: value + 100,   &    realizedLongTermLoss: value - 100,       realizedLoss: value,   &    realizedShortTermGain: value + 10,   &    realizedShortTermLoss: value - 10,       returnsTooltip,       savingsEstimate: value,       taxSavingsTooltip,   *    timeWeightedReturn: (value + 1) / 100,       year: 2021,   B    shouldShowBondPortfolioInterestDecJanSpecialCaseNotice: false,   $    dividendTaxesSaved: value + 100,       marginalStateTax: 0,   ,    treasuryEtfDividendsEarned: value + 200,     };�   b          �   [export const getTaxSavingsEstimates: WealthfrontApiReturnType<'getTaxSavingsEstimates'> = {     allTimeFeesPaid: 9.67,     allTimeGain: 1565.21,     allTimeLongTermGain: 281.43,     allTimeLongTermLoss: 115.11,     allTimeLoss: 2505.86,   #  allTimeSavingsEstimate: 817.9625,      allTimeShortTermGain: 1283.78,      allTimeShortTermLoss: 2390.75,   1  allTimeTimeWeightedReturn: 0.06504599192034076,   1  allTimeMoneyWeightedReturn: 0.0482493006032856,   !  allTimeDividendsEarned: 512.43,   3  insertTaxSavingsTooltipTableAfterSectionIndex: 1,   (  allTimeReturnsTooltip: returnsTooltip,   8  allTimeDividendsEarnedTooltip: dividendsEarnedTooltip,   .  allTimeTaxSavingsTooltip: taxSavingsTooltip,     estimates: [       {         feesPaid: 0.0,         realizedGain: 3.69,          realizedLongTermGain: 0.0,   !      realizedLongTermLoss: 1.04,         realizedLoss: 215.46,   "      realizedShortTermGain: 3.69,   $      realizedShortTermLoss: 214.42,         savingsEstimate: 71.1018,         timeWeightedReturn: 0.92,          moneyWeightedReturn: 1.26,         dividendsEarned: 123.45,   7      insertTaxSavingsTooltipTableAfterSectionIndex: 0,         returnsTooltip,         dividendsEarnedTooltip,         taxSavingsTooltip,         year: 2016,       },       {         feesPaid: 0.0,         realizedGain: 44.65,   "      realizedLongTermGain: 38.37,          realizedLongTermLoss: 0.0,         realizedLoss: 19.91,   "      realizedShortTermGain: 6.28,   #      realizedShortTermLoss: 19.91,         savingsEstimate: 6.5703,   !      timeWeightedReturn: -0.123,   "      moneyWeightedReturn: -0.456,         dividendsEarned: 123.45,   7      insertTaxSavingsTooltipTableAfterSectionIndex: 0,         returnsTooltip,         dividendsEarnedTooltip,         taxSavingsTooltip,         year: 2017,       },       {         feesPaid: 0.0,         realizedGain: 282.57,   #      realizedLongTermGain: 104.44,   "      realizedLongTermLoss: 29.86,         realizedLoss: 372.95,   $      realizedShortTermGain: 178.13,   $      realizedShortTermLoss: 343.09,          savingsEstimate: 119.1917,   !      timeWeightedReturn: -0.123,   "      moneyWeightedReturn: -0.456,         dividendsEarned: 123.45,   7      insertTaxSavingsTooltipTableAfterSectionIndex: 0,         returnsTooltip,         dividendsEarnedTooltip,         taxSavingsTooltip,         year: 2018,       },       {         feesPaid: 6.32,         realizedGain: 356.64,   #      realizedLongTermGain: 107.21,   !      realizedLongTermLoss: 7.74,         realizedLoss: 575.03,   $      realizedShortTermGain: 249.43,   $      realizedShortTermLoss: 567.29,          savingsEstimate: 188.7537,   !      timeWeightedReturn: -0.123,   "      moneyWeightedReturn: -0.456,         dividendsEarned: 123.45,   7      insertTaxSavingsTooltipTableAfterSectionIndex: 0,         returnsTooltip,         dividendsEarnedTooltip,         taxSavingsTooltip,         year: 2019,       },       {         feesPaid: 3.35,         realizedGain: 877.66,   "      realizedLongTermGain: 31.41,   "      realizedLongTermLoss: 76.47,         realizedLoss: 1252.73,   $      realizedShortTermGain: 846.25,   %      realizedShortTermLoss: 1176.26,          savingsEstimate: 409.3176,   !      timeWeightedReturn: -0.123,   "      moneyWeightedReturn: -0.456,         dividendsEarned: 123.45,   7      insertTaxSavingsTooltipTableAfterSectionIndex: 0,         returnsTooltip,         dividendsEarnedTooltip,         taxSavingsTooltip,         year: 2020,       },       {         feesPaid: 1.35,         realizedGain: 177.66,   "      realizedLongTermGain: 31.41,   "      realizedLongTermLoss: 76.47,         realizedLoss: 1252.73,   $      realizedShortTermGain: 846.25,   %      realizedShortTermLoss: 1176.26,          savingsEstimate: 409.3176,   !      timeWeightedReturn: -0.123,   "      moneyWeightedReturn: -0.456,         dividendsEarned: 123.45,   7      insertTaxSavingsTooltipTableAfterSectionIndex: 0,         returnsTooltip,         dividendsEarnedTooltip,         taxSavingsTooltip,         year: 2021,       },       {         feesPaid: 0.0,         realizedGain: 0.0,          realizedLongTermGain: 0.0,          realizedLongTermLoss: 0.0,         realizedLoss: 69.78,   !      realizedShortTermGain: 0.0,   #      realizedShortTermLoss: 69.78,         savingsEstimate: 23.0274,   !      timeWeightedReturn: -0.123,   "      moneyWeightedReturn: -0.456,         dividendsEarned: 123.45,   7      insertTaxSavingsTooltipTableAfterSectionIndex: 0,         returnsTooltip,         dividendsEarnedTooltip,         taxSavingsTooltip,         year: 2015,       },     ],     experimentAssignment: {        experimentAssignment: 'fee',   /    experimentName: 'tlh_tax_savings_20200713',     },     feesTooltip: [       {   o      body: 'Wealthfront charges an annual advisory fee equal to 0.25% of your portfolio value, paid monthly.',   &      header: 'How we calculate fees',       },     ],     gainsTooltip: [       {  Q      body: 'When you sell an investment for more than you paid for it, you realize a capital gain. There are two kinds of realized gains: short-term and long-term. Short-term capital gains generally come from assets you held for less than a year, whereas long-term capital gains generally come from assets you held for a year or more.',   )      header: 'What are realized gains?',       },       {  M      body: 'A realized gain results from selling an asset at a price higher than when it was bought. You can realize gains when you transfer assets into Wealthfront (that we diversify), when you make a significant withdrawal from your Investment Account, as a result of changing your risk score, major rebalancing events, or transitioning into US Direct Indexing.\n\nIn general, we aim to operate your Wealthfront Investment Account in a tax-efficient manner. When we do generate taxable gains, we attempt to generate only long-term capital gains because they are taxed at a lower rate.',   )      header: 'When do I realize gains?',       },     ],     lossTooltip: [       {   �      body: 'This number is the total amount of investment losses, both long-term and short-term, that we\u2019ve harvested from your portfolio over this time period.',   %      header: 'What is this number?',       },       {   �      body: 'Believe it or not, these losses work to your advantage. You may be able to use them to reduce your tax bill by offsetting income and investment gains that would otherwise be taxed.',   #      header: 'What does it mean?',       },     ],   /  variant: TaxSavingsEstimates.VariantEnum.FEE,   *  taxSavingsEstimatesForEachPeriodRange: {   %    2021: createPeriodRangeData(100),   $    ALL: createPeriodRangeData(200),   +    FIVE_YEARS: createPeriodRangeData(300),   ,    THREE_YEARS: createPeriodRangeData(400),   )    ONE_YEAR: createPeriodRangeData(500),   +    SIX_MONTHS: createPeriodRangeData(600),   -    THREE_MONTHS: createPeriodRangeData(700),     },        "allTimeSampleTaxSavings": {   !        "lowerBoundSavings": 188,   !        "upperBoundSavings": 388,           "totalLosses": 1000,           "federalTaxRate": 0.35,           "stateTaxRate": 0.0,   $        "capitalGainsTaxRate": 0.15,   /        "netInvestmentIncomeThreshold": 200000,   %        "longTermOffsetSavings": 188,   &        "shortTermOffsetSavings": 388,   #        "incomeOffsetSavings": 350,           "taxYearsOpen": 1,   %        "ordinaryIncomeOffset": 3000,   +        "netInvestmentIncomeTaxRate": 0.038       },   )  bondPortfolioDividendHistoryResponse: {   !    totalDividendsEarned: 140.93,       dataPoints: [         {           yearMonth: {             year: 2023,             month: 6,   
        },   F        shouldShowBondPortfolioInterestDecJanSpecialCaseNotice: false,           dividendInfo: {             dividendsEarned: 0.0,   !          dividendsReceived: 0.0,              dividendsPending: 0.0,   
        },         },         {           yearMonth: {             year: 2023,             month: 7,   
        },   F        shouldShowBondPortfolioInterestDecJanSpecialCaseNotice: false,           dividendInfo: {   !          dividendsEarned: 880.0,   #          dividendsReceived: 880.0,              dividendsPending: 0.0,   
        },   9        exDateMessage: 'This is a test message for July',         },         {           yearMonth: {             year: 2023,             month: 8,   
        },   F        shouldShowBondPortfolioInterestDecJanSpecialCaseNotice: false,           dividendInfo: {   #          dividendsEarned: 1235.89,   %          dividendsReceived: 1235.89,              dividendsPending: 0.0,   
        },         },         {           yearMonth: {             year: 2023,             month: 9,   
        },   F        shouldShowBondPortfolioInterestDecJanSpecialCaseNotice: false,           dividendInfo: {   #          dividendsEarned: 1286.86,   %          dividendsReceived: 1286.86,              dividendsPending: 0.0,   
        },   >        exDateMessage: 'This is a test message for September',         },         {           yearMonth: {             year: 2023,             month: 10,   
        },   F        shouldShowBondPortfolioInterestDecJanSpecialCaseNotice: false,           dividendInfo: {   #          dividendsEarned: 1323.55,   $          dividendsReceived: 323.55,   #          dividendsPending: 1000.0,   
        },         },         {           yearMonth: {             year: 2023,             month: 11,   
        },   F        shouldShowBondPortfolioInterestDecJanSpecialCaseNotice: false,           dividendInfo: {   #          dividendsEarned: 1367.88,   !          dividendsReceived: 0.0,   $          dividendsPending: 1367.88,   
        },   =        exDateMessage: 'This is a test message for November',         },         {           yearMonth: {             year: 2023,             month: 12,   
        },   E        shouldShowBondPortfolioInterestDecJanSpecialCaseNotice: true,   F        exDateMessage: 'Dividend payment will be determined on Dec 2',         },         {           yearMonth: {             year: 2024,             month: 1,   
        },   E        shouldShowBondPortfolioInterestDecJanSpecialCaseNotice: true,   <        exDateMessage: 'This is a test message for January',         },         {           yearMonth: {             year: 2024,             month: 2,   
        },   F        shouldShowBondPortfolioInterestDecJanSpecialCaseNotice: false,         },         {           yearMonth: {             year: 2024,             month: 3,   
        },   F        shouldShowBondPortfolioInterestDecJanSpecialCaseNotice: false,         },         {           yearMonth: {             year: 2024,             month: 4,   
        },   F        shouldShowBondPortfolioInterestDecJanSpecialCaseNotice: false,         },         {           yearMonth: {             year: 2024,             month: 5,   
        },   F        shouldShowBondPortfolioInterestDecJanSpecialCaseNotice: false,         },         {           yearMonth: {             year: 2024,             month: 6,   
        },   F        shouldShowBondPortfolioInterestDecJanSpecialCaseNotice: false,         },         {           yearMonth: {             year: 2024,             month: 7,   
        },   F        shouldShowBondPortfolioInterestDecJanSpecialCaseNotice: false,         },         {           yearMonth: {             year: 2024,             month: 8,   
        },   F        shouldShowBondPortfolioInterestDecJanSpecialCaseNotice: false,         },         {           yearMonth: {             year: 2024,             month: 9,   
        },   F        shouldShowBondPortfolioInterestDecJanSpecialCaseNotice: false,         },         {           yearMonth: {             year: 2024,             month: 10,   
        },   F        shouldShowBondPortfolioInterestDecJanSpecialCaseNotice: false,         },         {           yearMonth: {             year: 2024,             month: 11,   
        },   F        shouldShowBondPortfolioInterestDecJanSpecialCaseNotice: false,         },         {           yearMonth: {             year: 2024,             month: 12,   
        },   E        shouldShowBondPortfolioInterestDecJanSpecialCaseNotice: true,         },         {           yearMonth: {             year: 2025,             month: 1,   
        },   E        shouldShowBondPortfolioInterestDecJanSpecialCaseNotice: true,         },         {           yearMonth: {             year: 2025,             month: 2,   
        },   F        shouldShowBondPortfolioInterestDecJanSpecialCaseNotice: false,         },         {           yearMonth: {             year: 2025,             month: 3,   
        },   F        shouldShowBondPortfolioInterestDecJanSpecialCaseNotice: false,         },         {           yearMonth: {             year: 2025,             month: 4,   
        },   F        shouldShowBondPortfolioInterestDecJanSpecialCaseNotice: false,         },         {           yearMonth: {             year: 2025,             month: 5,   
        },   F        shouldShowBondPortfolioInterestDecJanSpecialCaseNotice: false,         },       ],     },   };5��    b   >   �      �     �      R/      i+      �    >       !      !      #      ]            �    -                   {      ]      J      �    "                   ;	                  �                       j      �      �      �                       �       �      �      �        8      E      E   8       Z       Z       5��