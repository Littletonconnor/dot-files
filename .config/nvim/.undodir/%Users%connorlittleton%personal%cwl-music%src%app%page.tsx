Vim�UnDo� 80�/�QOfT6�Q���cܹ
�`▰�2Y                                     gbϙ    _�                             ����                                                                                                                                                                                                                                                                                                                                                  V        gb��     �                  import { Suspense } from 'react'       3import { SongTable } from '@/components/song-table'   .import { getAllSongs } from '@/lib/db/queries'       interface PageProps {   &  searchParams: Promise<{ q: string }>   }       ;export default function Page({ searchParams }: PageProps) {   
  return (   V    <div className="flex-1 flex flex-col overflow-hidden bg-[#0A0A0A] pb-[69px] pt-2">   !      <div className="min-w-max">   F        <Suspense fallback={<div className="w-full">Loading...</div>}>   0          <Tracks searchParams={searchParams} />           </Suspense>         </div>   
    </div>     )   }       4async function Tracks({ searchParams }: PageProps) {   '  const query = (await searchParams)?.q   #  const songs = await getAllSongs()   .  const filteredSongs = songs.filter((song) =>   I    song.name.toLowerCase().startsWith(query?.toLocaleLowerCase() ?? ''),     )     //@ts-ignore   H  return <SongTable query={query} playlist={{ songs: filteredSongs }} />   }5��                                  �             5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        gb��    �                   �               5��                    !                      �      5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        gb��    �          "      Dimport { ScrollArea, ScrollBar } from '@/components/ui/scroll-area';   2import { TrackTable } from './p/[id]/track-table';   <import { getAllSongs, searchSongs } from '@/lib/db/queries';   !import { Suspense } from 'react';�         "        searchParams,�      
   "      '  searchParams: Promise<{ q: string }>;�   
      "      '  const query = (await searchParams).q;   G  const songs = query ? await searchSongs(query) : await getAllSongs();     // @ts-ignore   ;  return <TrackTable query={query} playlist={{ songs }} />;�         "        searchParams,�         "      '  searchParams: Promise<{ q: string }>;�      "   "      
  return (   V    <div className="flex-1 flex flex-col overflow-hidden bg-[#0A0A0A] pb-[69px] pt-2">   %      <ScrollArea className="flex-1">   #        <div className="min-w-max">   :          <Suspense fallback={<div className="w-full" />}>   2            <Tracks searchParams={searchParams} />             </Suspense>           </div>   .        <ScrollBar orientation="horizontal" />         </ScrollArea>   
    </div>     );5��                       R      �      g      �                         %                    �                                             �    
                   2      �       ~       �                                             �                         �                     �        &                 &       �       �       5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        gb��     �                2import { TrackTable } from "./p/[id]/track-table";5��                          E       3               5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        gb��     �                 Dimport { ScrollArea, ScrollBar } from "@/components/ui/scroll-area";5��                                   E               5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        gb��     �                "			<ScrollArea className="flex-1">5��                          1      #               5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V       gb��    �                *				<ScrollBar orientation="horizontal" />   			</ScrollArea>5��                          �      <               5�_�      
                      ����                                                                                                                                                                                                                                                                                                                                                  V       gb��    �               				<div className="min-w-max">   5					<Suspense fallback={<div className="w-full" />}>   ,						<Tracks searchParams={searchParams} />   					</Suspense>   
				</div>5��                       4      �       �       5�_�         	       
          ����                                                                                                                                                                                                                                                                                                                                                  V       gbϏ     �   
             	// @ts-ignore5��    
                      &                     5�_�   
                    
    ����                                                                                                                                                                                                                                                                                                                                                  V       gbϓ     �                5��                          _               2       5�_�                       
    ����                                                                                                                                                                                                                                                                                                                                                  V       gbϖ    �                 �             5��                          X                     �                         Z                     5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V       gbϘ    �                 // @ts-ignore5��                         X                    5�_�              
   	           ����                                                                                                                                                                                                                                                                                                                                                  V       gb��     �              �                5��                          �                     �              &           �      &               �                      
   �             
       �       	                  �                     �                         �                     �                         �                     �                         �                     �                         �                     �                         �                     �                         �                     �                         �                     �                         �                     �                          �                     5��