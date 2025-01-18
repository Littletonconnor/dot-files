Vim�UnDo� ^�6���u�O0��d��M�Et�O����~װ   _                                   g�*�     _�                              ����                                                                                                                                                                                                                                                                                                                                                             g�*�     �               f   9import { flattenChildren } from '@wealthfront/utilities';   $import classNames from 'classnames';   import * as React from 'react';   7import { TestIdProp } from '../../utils/testid/testid';   vimport { SummaryListHighlight, SummaryListProvider, SummaryListSpacing, SummaryListVariant } from './context/context';   .import { SummaryListItem } from './item/item';       const variants = {     desktopColumns: {       '1': 'grid-cols-[auto]',   2    '2': 'sm-max:grid-cols-[auto] md:grid-cols-2',     },   } as const;       6export interface SummaryListProps extends TestIdProp {     /**   4   * The list of items (key-value pairs) to display.      */     children: React.ReactNode;         /**   A   * The number of columns to display items in on larger screens.      */     desktopColumns?: 1 | 2;         /**   3   * The sections to highlight in the summary list.      */   #  highlight?: SummaryListHighlight;         /**   @   * An optional boolean to show the divider between list items.      */     showDividers?: boolean;         /**   -   * The vertical spacing between list items.      */     spacing?: SummaryListSpacing;         /**   7   * The variant style to use when displaying the text.      */     variant?: SummaryListVariant;   }       /**   f * Display a summary of data in a list. Commonly used to display metadata (a list of key-value pairs).    */   export const SummaryList = ({     children,     desktopColumns = 1,     highlight = 'value',     showDividers = true,     variant = 'body',     spacing = 'small',   	  testId,   }: SummaryListProps) => {   6  const flattenedChildren = flattenChildren(children);   U  const childrenWithProps = React.Children.map(flattenedChildren, (child, index) => {       const newProps = {         __localIndex: index,       };   &    if (React.isValidElement(child)) {   1      return React.cloneElement(child, newProps);       }       return child;     });       @  const totalChildren = React.Children.count(childrenWithProps);   ?  const columnSize = Math.ceil(totalChildren / desktopColumns);       
  return (       <SummaryListProvider         highlight={highlight}   !      showDividers={showDividers}         variant={variant}   #      totalChildren={totalChildren}         spacing={spacing}       >   	      <dl   w        className={classNames('grid gap-xxlarge m-0', variants.desktopColumns[desktopColumns.toString() as '1' | '2'])}           data-testid={testId}   ,        data-toolkit-component="SummaryList"         >   ?        {Array.from({ length: desktopColumns }, (_, index) => {             return (               <div   U              className="sm-max:py-small first:pt-0 last:pb-0 tk-summary-list-column"                 key={index}   -              data-testid={`column-${index}`}               >   \              {childrenWithProps.slice(index * columnSize, index * columnSize + columnSize)}               </div>             );           })}         </dl>       </SummaryListProvider>     );   };       #SummaryList.Item = SummaryListItem;5�5��