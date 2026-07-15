declare module '@apiverve/datecalculator' {
  export interface datecalculatorOptions {
    api_key: string;
    secure?: boolean;
  }

  /**
   * Describes fields the current plan does not unlock. Locked fields arrive as null
   * in `data`; `locked_fields` names them, using dot paths for nested fields.
   * Absent when the plan unlocks everything.
   */
  export interface PremiumInfo {
    message: string;
    upgrade_url: string;
    locked_fields: string[];
  }

  export interface datecalculatorResponse {
    status: string;
    error: string | null;
    data: DateCalculatorData;
    code?: number;
    premium?: PremiumInfo;
  }


  interface DateCalculatorData {
      minutes: number | null;
      hours:   number | null;
      days:    number | null;
      weeks:   number | null;
      months:  number | null;
      years:   number | null;
      start:   End;
      end:     End;
  }
  
  interface End {
      date:  Date | null;
      day:   null | string;
      month: null | string;
      year:  null | string;
      words: null | string;
  }

  export default class datecalculatorWrapper {
    constructor(options: datecalculatorOptions);

    execute(callback: (error: any, data: datecalculatorResponse | null) => void): Promise<datecalculatorResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: datecalculatorResponse | null) => void): Promise<datecalculatorResponse>;
    execute(query?: Record<string, any>): Promise<datecalculatorResponse>;
  }
}
