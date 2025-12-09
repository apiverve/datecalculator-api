declare module '@apiverve/datecalculator' {
  export interface datecalculatorOptions {
    api_key: string;
    secure?: boolean;
  }

  export interface datecalculatorResponse {
    status: string;
    error: string | null;
    data: DateCalculatorData;
    code?: number;
  }


  interface DateCalculatorData {
      minutes: number;
      hours:   number;
      days:    number;
      weeks:   number;
      months:  number;
      years:   number;
      start:   End;
      end:     End;
  }
  
  interface End {
      date:  Date;
      day:   string;
      month: string;
      year:  string;
      words: string;
  }

  export default class datecalculatorWrapper {
    constructor(options: datecalculatorOptions);

    execute(callback: (error: any, data: datecalculatorResponse | null) => void): Promise<datecalculatorResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: datecalculatorResponse | null) => void): Promise<datecalculatorResponse>;
    execute(query?: Record<string, any>): Promise<datecalculatorResponse>;
  }
}
